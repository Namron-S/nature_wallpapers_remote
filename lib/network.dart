import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

Future<List<Photo>> fetchPhotos() async {
  final noOfPicsPerPage = 80; // 80 is the maximum
  const Map<String, String> headers = {
    'Authorization': '563492ad6f917000010000017f1e943be9604f38ae1245bce98ee84a'
  };
  String photoBaseUrl =
      'https://api.pexels.com/v1/search?query=corona&per_page=$noOfPicsPerPage';

  final http.Response response = await http.get(photoBaseUrl, headers: headers);
  if (response.statusCode == 200) {
    return convertResponseToPhotoList(response);
  } else {
    throw Exception('Failed to load pictures');
  }
}

List<Photo> convertResponseToPhotoList(http.Response response) {
  List<Photo> photoList = new List();
  Map<String, dynamic> jsonMap = json.decode(response.body);
  jsonMap['photos'].forEach((element) {
    photoList.add(Photo.fromMap(element));
  });
  return photoList;
}
