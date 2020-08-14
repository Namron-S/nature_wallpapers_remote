import 'package:flutter/material.dart';
import 'model.dart';

Widget getWallPaperWidget(List<Photo> photoList) {
  return GridView.count(
    crossAxisCount: 2,
    children: photoList
        .map((e) => Center(
            child: GridTile(child: Image.network('${e.source.portrait}'))))
        .toList(),
  );
}
