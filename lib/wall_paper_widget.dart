import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:provider/provider.dart';

Widget getWallPapersWidget(List<Photo> photoList, BuildContext context,
    String pageName, Function refreshFuture) {
  return OrientationBuilder(
    builder: (context, orientation) {
      return GridView.builder(
          itemCount: photoList.length,
          padding: const EdgeInsets.only(left: 6, right: 6),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return FittedBox(
              fit: BoxFit.fill,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                      photo: photoList[index],
                      pageName: pageName,
                      refreshFuture: refreshFuture,
                    );
                  }));
                },
                child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: '${photoList[index].src.tiny}',
                ),
              ),
            );
          });
    },
  );
}

class DetailScreen extends StatelessWidget {
  final Photo photo;
  final String pageName;
  final Function refreshFuture;

  const DetailScreen(
      {Key key,
      @required this.photo,
      @required this.pageName,
      @required this.refreshFuture})
      : super(key: key);

  void _setWallPaper(
      {@required bool asHomeScreen, @required bool asLockScreen}) async {
    int location;
    String result;

    if (asHomeScreen) location = WallpaperManager.HOME_SCREEN;
    if (asLockScreen) location = WallpaperManager.LOCK_SCREEN;
    DefaultCacheManager dfltCchMngr = new DefaultCacheManager();

    try {
      var file = await dfltCchMngr.getSingleFile(this.photo.src.portrait);
      result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    } on PlatformException {
      result = 'Failed to get wallpaper';
    }
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    bool _isFavorite =
        Provider.of<FavoriteList>(context).photoList.contains(this.photo);
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CachedNetworkImage(imageUrl: this.photo.src.portrait),
        ),
        floatingActionButton: Builder(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                //heroTag muss gesetzt werden, sonst Exception: there are multiple heroes that share the same tag
                heroTag: 'ButtonHomeScreen',
                onPressed: () {
                  _setWallPaper(asHomeScreen: true, asLockScreen: false);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Wallpaper was set as homescreen.')));
                },
                tooltip: 'Set as Homescreen',
                child: Icon(Icons.home),
              ),
              FloatingActionButton(
                heroTag: 'ButtonLockScreen',
                onPressed: () {
                  _setWallPaper(asHomeScreen: false, asLockScreen: true);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Wallpaper was set as lockscreen.')));
                },
                tooltip: 'Set as Locksreen',
                child: Icon(Icons.screen_lock_portrait),
              ),
              FloatingActionButton(
                heroTag: 'ButtonFavorites',
                onPressed: () {
                  _toggleFavorites(context, pageName, refreshFuture);
                },
                tooltip:
                    _isFavorite ? 'Remove from favorites' : 'Add to favorites',
                child:
                    Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFavorites(
      BuildContext context, String pageName, Function refreshFuture) {
    String message;

    if (Provider.of<FavoriteList>(context, listen: false)
        .photoList
        .contains(this.photo)) {
      Provider.of<FavoriteList>(context, listen: false)
          .removeFavorite(this.photo);
      message = 'Removed from favorites.';
    } else {
      Provider.of<FavoriteList>(context, listen: false).addFavorite(this.photo);
      message = 'Added to favorites.';
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500),
    ));

    //TODO: remove Debugging
    /* Provider.of<FavoriteList>(context, listen: false)
        .photoList
        .forEach((element) {
      print(element.id);
    });*/

    //If we are in the favoritePage, we have to update the future-Builder:
    if (pageName == 'Favorites') {
      //TODO: use parent Callback
      refreshFuture();
    }
  }
}

class DetailScreen2 extends StatefulWidget {
  //final String photoUrl; =photoList[index].src.portrait
  final Photo photo;

  DetailScreen2({Key key, @required this.photo}) : super(key: key);

  @override
  _DetailScreen2State createState() => _DetailScreen2State();
}

class _DetailScreen2State extends State<DetailScreen2> {
  bool _isFavorite;

  @override
  void initState() {
    super.initState();
    this._isFavorite =
        Provider.of<FavoriteList>(context).photoList.contains(widget.photo);
  }

  void _toggleFavorites() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite)
        Provider.of<FavoriteList>(context).addFavorite(widget.photo);
      else
        Provider.of<FavoriteList>(context).removeFavorite(widget.photo);
    });
  }

  void _setWallPaper(
      {@required bool asHomeScreen, @required bool asLockScreen}) async {
    int location;
    String result;

    if (asHomeScreen) location = WallpaperManager.HOME_SCREEN;
    if (asLockScreen) location = WallpaperManager.LOCK_SCREEN;
    DefaultCacheManager dfltCchMngr = new DefaultCacheManager();

    try {
      var file =
          await dfltCchMngr.getSingleFile(this.widget.photo.src.portrait);
      result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    } on PlatformException {
      result = 'Failed to get wallpaper';
    }
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CachedNetworkImage(imageUrl: this.widget.photo.src.portrait),
        ),
        floatingActionButton: Builder(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                //heroTag muss gesetzt werden, sonst Exception: there are multiple heroes that share the same tag
                heroTag: 'ButtonHomeScreen',
                onPressed: () {
                  _setWallPaper(asHomeScreen: true, asLockScreen: false);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Wallpaper was set as homescreen.')));
                },
                tooltip: 'Set as Homescreen',
                child: Icon(Icons.home),
              ),
              FloatingActionButton(
                heroTag: 'ButtonLockScreen',
                onPressed: () {
                  _setWallPaper(asHomeScreen: false, asLockScreen: true);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Wallpaper was set as lockscreen.')));
                },
                tooltip: 'Set as Locksreen',
                child: Icon(Icons.screen_lock_portrait),
              ),
              FloatingActionButton(
                heroTag: 'ButtonFavorites',
                onPressed: () {
                  _toggleFavorites();
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: _isFavorite
                          ? Text('Added to favorites.')
                          : Text('Removed from favorites.')));
                },
                tooltip:
                    _isFavorite ? 'Remove from favorites' : 'Add to favorites',
                child:
                    Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
