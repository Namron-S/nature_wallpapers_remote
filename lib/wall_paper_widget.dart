import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

Widget getWallPapersWidget(List<Photo> photoList, BuildContext context) {
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
                        photoUrl: photoList[index].src.portrait);
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

class DetailScreen extends StatefulWidget {
  final String photoUrl;

  DetailScreen({Key key, @required this.photoUrl}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  void _toggleFavorites() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    print('Todo: Add ${this.widget.photoUrl} to favorites.');
  }

  void _setWallPaper(
      {@required bool asHomeScreen, @required bool asLockScreen}) async {
    int location;
    String result;

    if (asHomeScreen) location = WallpaperManager.HOME_SCREEN;
    if (asLockScreen) location = WallpaperManager.LOCK_SCREEN;
    DefaultCacheManager dfltCchMngr = new DefaultCacheManager();

    try {
      var file = await dfltCchMngr.getSingleFile(this.widget.photoUrl);
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
          child: CachedNetworkImage(imageUrl: this.widget.photoUrl),
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
