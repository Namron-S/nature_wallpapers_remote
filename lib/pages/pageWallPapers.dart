import '../model.dart';
import '../network.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:corona_wallpaper_app/navigation/drawer.dart';
import 'package:corona_wallpaper_app/wall_paper_widget.dart';
import 'package:flutter/material.dart';

class PageWallPaper extends StatefulWidget {
  PageWallPaper({Key key, @required this.query}) : super(key: key);
  final String query;

  @override
  _PageWallPaperState createState() => _PageWallPaperState();
}

class _PageWallPaperState extends State<PageWallPaper> {
  Future<List<Photo>> photoList;

  @override
  void initState() {
    super.initState();
    photoList = getPhotos(widget.query);
    if (Device.get().isPhone)
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text('${widget.query} Wallpapers'),
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
