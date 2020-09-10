import 'package:flutter/material.dart';
import 'navigation.dart' as navi;

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          Divider(),
          ListTile(
            title: Text('Go to Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.home);
            },
          ),
          ListTile(
            title: Text('Go to Page 1'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.page1);
            },
          ),
          ListTile(
            title: Text('Go to Page 2'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.page2);
            },
          ),
          //_createDrawerItem(icon: Icons.home, text: 'Page 1'),
          //_createDrawerItem(icon: Icons.home, text: 'Page 2'),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    child: Text('Drawer Header'),
    decoration: BoxDecoration(
      color: Colors.blue,
    ),
  );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
