import '../model.dart';
import '../network.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:corona_wallpaper_app/drawer.dart';
import 'package:corona_wallpaper_app/wall_paper_widget.dart';
import 'package:flutter/material.dart';

class PageWallPaper extends StatefulWidget {
  PageWallPaper({Key key, @required this.query}) : super(key: key);
  final String query;

  @override
  _PageWallPaperState createState() => _PageWallPaperState(query);
}

class _PageWallPaperState extends State<PageWallPaper> {
  _PageWallPaperState(this.query);
  Future<List<Photo>> photoList;
  final String query;

  @override
  void initState() {
    super.initState();
    photoList = getPhotos(query);
    if (Device.get().isPhone)
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text('$query Wallpapers'),
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
