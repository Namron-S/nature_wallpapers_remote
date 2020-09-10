import 'package:corona_wallpaper_app/drawer.dart';
import 'package:corona_wallpaper_app/wall_paper_widget.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'network.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'navigation.dart' as navi;

//TODO: Implement hamburger-menue
//TODO: Implement favorites, About-Section
//TODO: use xtra thread/isolate for downloading pictures?
//TODO: Implement different categories
//TODO: Use unsplash.api?

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: navi.homePage,
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Photo>> photoList;

  @override
  void initState() {
    super.initState();
    photoList = getPhotos('corona');
    if (Device.get().isPhone)
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text('Corona Wallpapers'),
        ),
        body: Center(
          child: FutureBuilder<List<Photo>>(
              future: photoList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return getWallPapersWidget(snapshot.data, context);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              }),
        ));
  }
}
