import 'package:flutter/material.dart';
import '../navigation/drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        child: Text('Some stuff about pexels.com and the author ;)'),
      ),
    );
  }
}
