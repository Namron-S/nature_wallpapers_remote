import 'package:corona_wallpaper_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

class PageFavorites extends StatefulWidget {
  PageFavorites({Key key}) : super(key: key);

  @override
  _PageFavoritesState createState() => _PageFavoritesState();
}

class _PageFavoritesState extends State<PageFavorites> {
  @override
  void initState() {
    super.initState();
    if (Device.get().isPhone)
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

/*
TODO: Unterschied zw. :
1. import '../drawer.dart'
2. import 'package:corona_wallpaperApp/drawer.dart'
???
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: Center(
          child: Text('Here are the favorites'),
        ));
  }
}
