import 'package:flutter/material.dart';
import 'navigation.dart' as navi;

//TODO: Implement favorites
//TODO: Use xtra thread/isolate for downloading pictures?
//TODO: Use unsplash.api?
//TODO: Implement guided tour.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: navi.pageWallpaperCorona,
      routes: navi.routes,
      title: 'Corona Wallpapers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(),
    );
  }
}
