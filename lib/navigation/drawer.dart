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
          ListTile(
            title: Text('Favorites'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.pageFavorites);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Corona'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.pageWallpaperCorona);
            },
          ),
          ListTile(
            title: Text('Nature'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.pageWallpaperNature);
            },
          ),
          ListTile(
            title: Text('City'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.pageWallpaperCity);
            },
          ),
          Divider(),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pushReplacementNamed(context, navi.pageAbout);
            },
          ),
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