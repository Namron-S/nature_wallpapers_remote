import 'package:flutter/material.dart';
import 'navigation.dart' as navi;

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Drawer(
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
  return Container(
    height: 100,
    child: DrawerHeader(
      child: ListTile(
        onTap: () {
          Navigator.of(context).pop();
        },
        trailing: Icon(Icons.menu),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
    ),
  );
}
