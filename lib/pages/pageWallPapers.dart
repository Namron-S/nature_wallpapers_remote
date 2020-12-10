import 'dart:io';

import 'package:provider/provider.dart';

import '../helpers.dart';
import '../model.dart';
import '../network.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:corona_wallpaper_app/navigation/drawer.dart';
import 'package:corona_wallpaper_app/getWallPapersWidget.dart';
import 'package:flutter/material.dart';

class PageWallPaper extends StatefulWidget {
  PageWallPaper({Key key, @required this.query}) : super(key: key);
  final String query;

  @override
  _PageWallPaperState createState() => _PageWallPaperState();
}

class _PageWallPaperState extends State<PageWallPaper>
    with WidgetsBindingObserver {
  Future<List<Photo>> photoList;

  @override
  void initState() {
    super.initState();
    initPhotoList();

    if (Device.get().isPhone)
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.addObserver(this);
  }

  void initPhotoList() {
    if (widget.query == 'Favorites') {
      photoList = Future<List<Photo>>.value(
          Provider.of<FavoriteList>(context, listen: false).photoList);
    } else {
      photoList = getPhotos(widget.query);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      await createPhotoListFile('favorites',
          Provider.of<FavoriteList>(context, listen: false).photoList);
    }
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void refreshPage() {
    setState(() {
      initPhotoList();
    });
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
                  return getWallPapersWidget(
                    snapshot.data,
                    context,
                    widget.query,
                    refreshPage,
                  );
                } else if (snapshot.hasError) {
                  if (snapshot.error.runtimeType == SocketException) {
                    return Column(
                      children: [
                        (Text('It seems like your network is offline.')),
                        FlatButton(
                          child: Text('Try again.'),
                          onPressed: () {
                            refreshPage();
                          },
                        ),
                      ],
                    );
                  } else {
                    return Text('Something went wrong.');
                  }
                }
                return CircularProgressIndicator();
              }),
        ));
  }
}
