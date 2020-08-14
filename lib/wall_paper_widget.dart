import 'package:flutter/material.dart';
import 'model.dart';

Widget getWallPaperWidget(List<Photo> photoList) {
  return GridView.count(
    crossAxisCount: 2,
    children: [
      Center(child: GridTile(child: Text('Text1'))),
      Center(child: GridTile(child: Text('Text2'))),
      Center(child: GridTile(child: Text('Text3'))),
      Center(child: GridTile(child: Text('Text4'))),
      Center(child: GridTile(child: Text('Text5'))),
      Center(child: GridTile(child: Text('Text6'))),
      Center(child: GridTile(child: Text('Text7'))),
      Center(child: GridTile(child: Text('Text8'))),
      Center(child: GridTile(child: Text('Text9'))),
    ],
  );
}
