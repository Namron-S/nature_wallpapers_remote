import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation/navigation.dart' as navi;
import 'model.dart';
import 'helpers.dart';

//TODO: Implement favorites
//TODO: implement 'waiting start Screen'?
//TODO: Use xtra thread/isolate for downloading pictures?
//TODO: Use unsplash.api?
//TODO: Implement guided tour.
//TODO: UI-Styling (Icons, ...)

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Photo> favoritePhotos = await getFavoritesList();
  FavoriteList favoriteList = FavoriteList();
  favoriteList.photoList = favoritePhotos;
  runApp(
    ChangeNotifierProvider(
      create: (_) => favoriteList,
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
