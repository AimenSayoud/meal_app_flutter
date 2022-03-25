import 'package:flutter/material.dart';
import 'package:flutter_meal_app/provider/meal_provider.dart';
import 'package:flutter_meal_app/provider/theme_provider.dart';

import 'package:flutter_meal_app/screens/categories/category_meals_screen.dart';
import 'package:flutter_meal_app/screens/favorite/favorite_screen.dart';

import 'package:flutter_meal_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  bool didHeJustEntered = true;

  @override
  initState() {
    Provider.of<MemeProvider>(context, listen: false).applySavedData();
    Provider.of<ThemeProvider>(context, listen: false).getThemeMode();
    Provider.of<ThemeProvider>(context, listen: false).getThemeColors();
    _pages = [
      {
        'page': CategoryMealsScreen(),
        'title': 'Memes',
      },
      {
        'page': FavoritesScreen(),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Memes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('favorites'),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
