import 'package:flutter/material.dart';
import 'package:flutter_meal_app/provider/meal_provider.dart';
import 'package:provider/provider.dart';

import '../../meme_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meme_details';

  Widget buildTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 150.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final memeId = ModalRoute.of(context).settings.arguments as String;
    final memeDetails = DATA_OF_MEME.firstWhere((meme) {
      return meme.id.contains(memeId);
    });
    Color accentColor = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('download page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildContainer(Image.asset(
              memeDetails.imageUrlInAssets,
              height: 400,
              width: double.infinity,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Provider.of<MemeProvider>(context).isTheMealFavorite(memeId)
              ? Icons.star
              : Icons.star_border,
        ),
        onPressed: () {
          Provider.of<MemeProvider>(context, listen: false)
              .toggleFavoriteMeal(memeId);
        },
      ),
    );
  }
}
