import 'package:flutter/material.dart';
import 'model.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget getWallPapersWidget(List<Photo> photoList, BuildContext context) {
  return GridView.count(
    crossAxisCount: 3,
    children: photoList
        .map((e) => Center(
                child: GridTile(
                    child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(
                    photoSource: e.source.portrait,
                  );
                }));
              },
              child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: '${e.source.tiny}'),
            ))))
        .toList(),
  );
}

class DetailScreen extends StatelessWidget {
  final String photoSource;
  const DetailScreen({Key key, @required this.photoSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: this.photoSource),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              //heroTag muss gesetzt werden, sonst Exception: there are multiple heroes that share the same tag
              heroTag: 'ButtonHomeScreen',
              onPressed: null,
              tooltip: 'Set as Homescreen',
              child: Icon(Icons.add_to_home_screen),
            ),
            FloatingActionButton(
              heroTag: 'ButtonLockScreen',
              onPressed: null,
              tooltip: 'Set as Locksreen',
              child: Icon(Icons.screen_lock_portrait),
            ),
          ],
        ),
      ),
    );
  }
}
