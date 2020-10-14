import 'package:flutter/material.dart';
import 'navigation.dart' as navi;

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createListTile('Favorites', context),
          Divider(),
          _createListTile('Corona', context),
          _createListTile('Nature', context),
          _createListTile('City', context),
          _createListTile('Support', context),
          _createListTile('Network', context),
          _createListTile('Teamwork', context),
          _createListTile('Dark', context),
          Divider(),
          _createListTile('About', context),
        ],
      ),
    );
  }
}

Widget _createListTile(String pageName, BuildContext context) {
  return ListTile(
    title: Text(pageName),
    onTap: () {
      Navigator.pushReplacementNamed(context, pageName);
    },
  );
}

Widget _createHeader(BuildContext context) {
  return DrawerHeader(
    child: Text('Drawer Header'),
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor,
    ),
  );
}
