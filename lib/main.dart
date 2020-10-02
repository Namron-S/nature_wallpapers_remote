import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation/navigation.dart' as navi;
import 'model.dart';

//TODO: Implement favorites
//TODO: Use xtra thread/isolate for downloading pictures?
//TODO: Use unsplash.api?
//TODO: Implement guided tour.
//TODO: UI-Styling (Icons, ...)

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteList(),
      child: MyApp(),
    ),
  );
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
    );
  }
}
