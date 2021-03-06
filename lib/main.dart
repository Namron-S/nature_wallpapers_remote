import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation/navigation.dart' as navi;
import 'model.dart';
import 'helpers.dart';

//TODO: UI: right size for navigation drawer

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
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: 'Nature',
      routes: navi.routes,
      title: 'Nature Wallpapers',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
