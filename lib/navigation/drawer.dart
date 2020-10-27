import 'dart:ui';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white.withOpacity(0.75), //Colors.transparent,
        //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: SizedBox(
        width: 180,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(context),
              _createListTile('Favorites', context),
              Divider(color: Colors.black),
              /*
beach, Clouds, Flowers, forest, landscape,
Mountains, Nature, night,sea, Sky, Sunset, 
*/
              _createListTile('Beach', context),
              _createListTile('Clouds', context),
              _createListTile('Flowers', context),
              _createListTile('Forest', context),
              _createListTile('Landscape', context),
              _createListTile('Mountains', context),
              _createListTile('Nature', context),
              _createListTile('Night', context),
              _createListTile('Sea', context),
              _createListTile('Sky', context),
              _createListTile('Sunset', context),
              Divider(color: Colors.black),
              _createListTile('About', context),
            ],
          ),
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
    height: 88, //88: found by trial & error
    //AppBar().preferredSize.height // not working, way too short
    //Scaffold.of(context).appBarMaxHeight, // not working, too short
    //MediaQuery.of(context).padding.top + kToolbarHeight,// not working, too short
    child: DrawerHeader(
      padding: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(
          'Navigation',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
        trailing: Icon(Icons.close),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
