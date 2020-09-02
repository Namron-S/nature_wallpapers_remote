import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

Widget getWallPapersWidget(List<Photo> photoList, BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  return GridView.builder(
      itemCount: photoList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //TODO: responsivness to orientation is not working
          crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen(photoUrl: photoList[index].source.portrait);
            }));
          },
          child: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: '${photoList[index].source.portrait}',
          ),
        ));
      });
}

class DetailScreen extends StatelessWidget {
  final String photoUrl;

  DetailScreen({Key key, @required this.photoUrl}) : super(key: key);

  void _setWallPaper(
      {@required bool asHomeScreen, @required bool asLockScreen}) async {
    int location;
    String result;

    if (asHomeScreen) location = WallpaperManager.HOME_SCREEN;
    if (asLockScreen) location = WallpaperManager.LOCK_SCREEN;
    DefaultCacheManager dfltCchMngr = new DefaultCacheManager();

    try {
      var file = await dfltCchMngr.getSingleFile(this.photoUrl);
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
          child: CachedNetworkImage(imageUrl: this.photoUrl),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              //heroTag muss gesetzt werden, sonst Exception: there are multiple heroes that share the same tag
              heroTag: 'ButtonHomeScreen',
              onPressed: () {
                _setWallPaper(asHomeScreen: true, asLockScreen: false);
              },
              tooltip: 'Set as Homescreen',
              child: Icon(Icons.add_to_home_screen),
            ),
            FloatingActionButton(
              heroTag: 'ButtonLockScreen',
              onPressed: () =>
                  _setWallPaper(asHomeScreen: false, asLockScreen: true),
              tooltip: 'Set as Locksreen',
              child: Icon(Icons.screen_lock_portrait),
            ),
          ],
        ),
      ),
    );
  }
}
