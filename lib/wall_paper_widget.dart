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
                String path = 'File Location of the cached NetworkImage';
                final snackBar = SnackBar(content: Text(path));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: '${e.source.tiny}'),
            ))))
        .toList(),
  );
}
