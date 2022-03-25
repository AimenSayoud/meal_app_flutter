import 'package:flutter/material.dart';
import 'package:flutter_meal_app/provider/meal_provider.dart';
import 'package:flutter_meal_app/provider/theme_provider.dart';
import 'package:flutter_meal_app/screens/categories/category_meals_screen.dart';

import 'package:flutter_meal_app/screens/meals/meal_detail_screen.dart';
import 'package:flutter_meal_app/screens/tabs_screen.dart';
import 'package:flutter_meal_app/screens/theme/theme_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MemeProvider>(
          create: (_) => MemeProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context).accentColor;
    var tmm = Provider.of<ThemeProvider>(context).tm;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: tmm,
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(241, 247, 233, 1),
        fontFamily: "Releway",
        buttonColor: accentColor.shade700,
        shadowColor: Colors.black45,
        cardColor: Color.fromRGBO(230, 247, 233, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.black87),
              bodyText2: TextStyle(color: Colors.black87),
              headline6: TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      darkTheme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: "Releway",
        buttonColor: Colors.white70,
        shadowColor: Colors.white60,
        unselectedWidgetColor: Colors.white60,
        cardColor: Color.fromRGBO(34, 39, 36, 1),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white70),
              bodyText2: TextStyle(color: Colors.white),
              headline6: TextStyle(
                color: Colors.white70,
                fontSize: 21,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        ThemeSettings.routeName: (context) => ThemeSettings(),
      },
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal app'),
      ),
      body: null,
    );
  }
}*/
