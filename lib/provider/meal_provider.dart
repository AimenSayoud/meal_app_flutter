import 'package:flutter/material.dart';
import 'package:flutter_meal_app/meme_data.dart';
import 'package:flutter_meal_app/modules/meme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemeProvider with ChangeNotifier {
  List<Meme> availableMeals = DATA_OF_MEME;
  List<Meme> favoriteMeals = [];
  List<String> favoriteMealsId = [];
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void toggleFavoriteMeal(String mealId) async {
    SharedPreferences prefs = await _prefs;

    final existingIndex =
        favoriteMeals.indexWhere((favoriteMeal) => favoriteMeal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      favoriteMealsId.remove(mealId);
      prefs.setStringList('favorite_memes', favoriteMealsId);
    } else {
      favoriteMeals
          .add(DATA_OF_MEME.firstWhere((element) => element.id == mealId));
      favoriteMealsId.add(mealId);
      prefs.setStringList('favorite_memes', favoriteMealsId);
    }
    notifyListeners();
  }

  bool isTheMealFavorite(String id) {
    return favoriteMeals.any((favoriteMeal) => favoriteMeal.id == id);
  }

  applySavedData() async {
    SharedPreferences prefs = await _prefs;

    favoriteMealsId = prefs.getStringList('favorite_memes') ?? [];

    favoriteMealsId.forEach((mealId) {
      int existingIndex =
          favoriteMeals.indexWhere(((element) => element.id == mealId));
      if (existingIndex < 0) {
        favoriteMeals
            .add(DATA_OF_MEME.firstWhere((element) => element.id == mealId));
      }
    });
    notifyListeners();
  }
}
