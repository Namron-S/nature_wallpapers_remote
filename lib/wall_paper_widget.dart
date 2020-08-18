import 'package:flutter/material.dart';
import 'model.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget getWallPaperWidget(List<Photo> photoList) {
  return GridView.count(
    crossAxisCount: 3,
    children: photoList
        .map((e) => Center(
            child: GridTile(
                child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: '${e.source.portrait}'))))
        .toList(),
  );
}
