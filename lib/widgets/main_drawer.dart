import 'package:flutter/material.dart';

import 'package:flutter_meal_app/screens/theme/theme_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, Function tapHandler, BuildContext context) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).buttonColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }, context),
          buildListTile('theme', Icons.style, () {
            Navigator.of(context).pushReplacementNamed(ThemeSettings.routeName);
          }, context),
          Divider(),
        ],
      ),
    );
  }
}
