import 'package:flutter/material.dart';
import 'drawer.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        child: Text('Text for page 2'),
      ),
    );
  }
}
