import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/meme_data.dart';
import 'package:flutter_meal_app/modules/meme.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meme> displayMeal = DATA_OF_MEME;

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: isLandscape ? 2.4 / 2 : 2.5 / 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (ctx, index) {
          Meme meals = displayMeal[index];
          return MealItem(
            imageUrlInAssets: meals.imageUrlInAssets,
            id: meals.id,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
