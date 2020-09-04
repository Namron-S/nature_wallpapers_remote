import 'dart:convert';
import 'model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
//import 'dart:developer';

Future<List<Photo>> getPhotoListFromFileSystem(String name) async {
  List<Photo> photoList = List<Photo>();
  final path = await _localPath;
  File file = File('$path/$name.txt');
  String jsonStr = await file.readAsString();
  //log(jsonStr); // Use developer.log() instead of print() for very large strings
  List<dynamic> listOfJsonObjects = jsonDecode(jsonStr);
  listOfJsonObjects.forEach((element) {
    photoList.add(Photo.fromJson(element));
  });

  return photoList;
}

Future<bool> photoListHasToBeCreated(String name) async {
  if (!await _photoListFileExists(name)) return true;
  if (await _photoListFileIsOutdated(name)) return true;
  return false;
}

Future<void> createPhotoListFile(String name, List<Photo> photoList) async {
  final path = await _localPath;
  File file = File('$path/$name.txt');
  String photoListasJsonStr = jsonEncode(photoList);
  await file.writeAsString(photoListasJsonStr);
}

Future<bool> _photoListFileExists(String name) async {
  final path = await _localPath;
  File file = File('$path/$name.txt');
  if (file.existsSync())
    return true;
  else
    return false;
}

Future<bool> _photoListFileIsOutdated(String name) async {
  final path = await _localPath;
  File file = File('$path/$name.txt');
  DateTime dateTimeLastModified = await file.lastModified();
  //File is viewed as outdatetd, if it's older than 30 days.
  if (dateTimeLastModified
      .isBefore(DateTime.now().subtract(new Duration(days: 30))))
    return true;
  else
    return false;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
