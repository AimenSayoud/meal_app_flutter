import 'package:flutter/material.dart';
import 'package:flutter_meal_app/modules/meme.dart';
import 'package:flutter_meal_app/provider/meal_provider.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Meme> _listOfFavoriteMeals;

  @override
  void didChangeDependencies() {
    _listOfFavoriteMeals = Provider.of<MemeProvider>(context).favoriteMeals;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_listOfFavoriteMeals.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('You have no favorite meal yet , start adding some'),
        ),
      );
    }
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          Meme meals = _listOfFavoriteMeals[index];
          return MealItem(
            imageUrlInAssets: meals.imageUrlInAssets,
            id: meals.id,
          );
        },
        itemCount: _listOfFavoriteMeals.length,
      ),
    );
  }
}
