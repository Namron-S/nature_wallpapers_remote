import 'package:flutter/material.dart';
import 'pages/pageAbout.dart';
import 'pages/pageWallPapers.dart';

const String pageWallpaperCorona = 'pageWallpaperCorona';
const String pageWallpaperNature = 'pageWallpaperNature';
const String pageWallpaperCity = 'pageWallpaperCity';
const String pageAbout = 'pageAbout';

const Map<String, Widget Function(BuildContext)> routes = const {
  pageWallpaperCorona: _toPageHome,
  pageWallpaperNature: _toPageNature,
  pageWallpaperCity: _toPageCity,
  pageAbout: _toPageAbout,
};

Widget _toPageHome(BuildContext context) {
  return PageWallPaper(
    query: 'Corona',
  );
}

Widget _toPageNature(BuildContext context) {
  return PageWallPaper(query: 'Nature');
}

Widget _toPageCity(BuildContext context) {
  return PageWallPaper(
    query: 'City',
  );
}

Widget _toPageAbout(BuildContext context) {
  return AboutPage();
}

/* 
TODO: //Why is this not working?
var toHome = (context) => MyHomePage();
var toPage2 = (context) => Page2();
var toPage1 = (context) => Page1();
// or this one is also not working:
Widget Function(BuildContext) toPage1 = (BuildContext context) {
  return Page1();
};
*/
