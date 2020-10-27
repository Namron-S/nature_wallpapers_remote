import 'package:flutter/material.dart';
import '../pages/pageAbout.dart';
import '../pages/pageWallPapers.dart';

/*
beach, Clouds, Flowers, forest, landscape,
Mountains, Nature, night,sea, Sky, Sunset, 
*/
const Map<String, Widget Function(BuildContext)> routes = const {
  'Favorites': _toPageFavorites,
  'About': _toPageAbout,
  'Beach': _toPageBeach,
  'Clouds': _toPageClouds,
  'Flowers': _toPageFlowers,
  'Forest': _toPageForest,
  'Landscape': _toPageLandscape,
  'Mountains': _toPageMountains,
  'Nature': _toPageNature,
  'Night': _toPageNight,
  'Sea': _toPageSea,
  'Sky': _toPageSky,
  'Sunset': _toPageSunset
};
Widget _toPageAbout(BuildContext context) {
  return AboutPage();
}

Widget _toPageFavorites(BuildContext context) {
  return PageWallPaper(
    query: 'Favorites',
  );
}

Widget _toPageBeach(BuildContext context) {
  return PageWallPaper(
    query: 'Beach',
  );
}

Widget _toPageClouds(BuildContext context) {
  return PageWallPaper(
    query: 'Clouds',
  );
}

Widget _toPageFlowers(BuildContext context) {
  return PageWallPaper(
    query: 'Flowers',
  );
}

Widget _toPageForest(BuildContext context) {
  return PageWallPaper(
    query: 'Forest',
  );
}

Widget _toPageLandscape(BuildContext context) {
  return PageWallPaper(
    query: 'Landscape',
  );
}

Widget _toPageMountains(BuildContext context) {
  return PageWallPaper(
    query: 'Mountains',
  );
}

Widget _toPageNature(BuildContext context) {
  return PageWallPaper(query: 'Nature');
}

Widget _toPageNight(BuildContext context) {
  return PageWallPaper(
    query: 'Night',
  );
}

Widget _toPageSea(BuildContext context) {
  return PageWallPaper(
    query: 'Sea',
  );
}

Widget _toPageSky(BuildContext context) {
  return PageWallPaper(
    query: 'Sky',
  );
}

Widget _toPageSunset(BuildContext context) {
  return PageWallPaper(
    query: 'Sunset',
  );
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
