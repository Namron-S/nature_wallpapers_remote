import 'package:flutter/material.dart';

import 'testPage1.dart';
import 'testPage2.dart';
import 'main.dart';

const String home = 'home';
const String page1 = 'page1';
const String page2 = 'page2';

const Map<String, Widget Function(BuildContext)> routes = const {
  home: _toHome,
  page1: _toPage1,
  page2: _toPage2,
};

Widget _toHome(BuildContext context) {
  return MyHomePage();
}

Widget _toPage1(BuildContext context) {
  return Page1();
}

Widget _toPage2(BuildContext context) {
  return Page2();
}

/* //Why is this not working?
var toHome = (context) => MyHomePage();
var toPage2 = (context) => Page2();
var toPage1 = (context) => Page1();
// or this one is also not working:
Widget Function(BuildContext) toPage1 = (BuildContext context) {
  return Page1();
};
*/
