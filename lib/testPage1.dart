import 'package:flutter/material.dart';
import 'drawer.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        child: Text('Text for page 1'),
      ),
    );
  }
}
