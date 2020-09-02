import 'package:corona_wallpaper_app/wall_paper_widget.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'network.dart';
import 'package:flutter/services.dart';

//TODO: Styling the GridView
//TODO: Load automatically more Pictures
//TODO: Save PhotoList to HD
//TODO: Only make API-Call when photoList is more than (2?) Weeks old.
//TODO: set to Orientation to Portrait only

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Wallpapers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
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
    photoList = fetchPhotos();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
