import 'package:flutter/material.dart';
import '../pages/pageAbout.dart';
import '../pages/pageWallPapers.dart';

const Map<String, Widget Function(BuildContext)> routes = const {
  'Favorites': _toPageFavorites,
  'Dark': _toPageDark,
  'Teamwork': _toPageTeamwork,
  'Corona': _toPageHome,
  'Nature': _toPageNature,
  'City': _toPageCity,
  'Support': _toPageSupport,
  'Network': _toPageNetwork,
  'About': _toPageAbout,
};

Widget _toPageDark(BuildContext context) {
  return PageWallPaper(
    query: 'Dark',
  );
}

Widget _toPageTeamwork(BuildContext context) {
  return PageWallPaper(
    query: 'Teamwork',
  );
}

Widget _toPageNetwork(BuildContext context) {
  return PageWallPaper(
    query: 'Network',
  );
}

Widget _toPageSupport(BuildContext context) {
  return PageWallPaper(
    query: 'Support',
  );
}

Widget _toPageFavorites(BuildContext context) {
  return PageWallPaper(
    query: 'Favorites',
  );
}

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
