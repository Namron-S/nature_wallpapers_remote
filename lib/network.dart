import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';
import 'helpers.dart';

Future<List<Photo>> getPhotos(String queryStr) async {
  List<Photo> photoList;
  if (await photoListHasToBeCreated(queryStr)) {
    photoList = await _fetchPhotos(queryStr);
    await createPhotoListFile(queryStr, photoList);
  } else {
    photoList = await getPhotoListFromFileSystem(queryStr);
  }
  return photoList;
}

Future<List<Photo>> _fetchPhotos(String queryStr) async {
  final noOfPicsPerPage = 80; // 80 is the maximum
  const Map<String, String> headers = {
    'Authorization': '563492ad6f917000010000017f1e943be9604f38ae1245bce98ee84a'
  };
  String photoBaseUrl =
      'https://api.pexels.com/v1/search?query=$queryStr&per_page=$noOfPicsPerPage';

  List<http.Response> respList =
      await _fetch3PagesOfPhotos(photoBaseUrl, headers);
  return _convertResponseListToPhotoList(respList);
}

Future<List<http.Response>> _fetch3PagesOfPhotos(
    var photoBaseUrl, final headers) async {
  List<http.Response> responseList = [];
  http.Response response;

  while (photoBaseUrl != null && responseList.length < 3) {
    print(photoBaseUrl);
    response = await _fetchOnePageOfPhotos(photoBaseUrl, headers);
    responseList.add(response);
    photoBaseUrl = _getNextPageOfPhotos(response);
  }

  return responseList;
}

Future<http.Response> _fetchOnePageOfPhotos(
    final photoBaseUrl, final headers) async {
  final http.Response response = await http.get(photoBaseUrl, headers: headers);
  if (response.statusCode == 200) {
    //return convertResponseToPhotoList(response);
    return response;
  } else {
    throw Exception(
        'Failed to load pictures\n HTTP-StatusCode: ${response.statusCode}\n ${response.body}');
  }
}

String _getNextPageOfPhotos(http.Response response) {
  Map<String, dynamic> jsonMap = json.decode(response.body);
  return jsonMap['next_page'];
}

List<Photo> _convertResponseListToPhotoList(List<http.Response> responseList) {
  List<Photo> photoList = [];
  for (var response in responseList) {
    Map<String, dynamic> jsonMap = json.decode(response.body);
    jsonMap['photos'].forEach((element) {
      photoList.add(Photo.fromJson(element));
    });
  }
  return photoList;
}
