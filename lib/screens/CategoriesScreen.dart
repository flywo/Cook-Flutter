import 'package:flutter/material.dart';
import 'package:cook/models/Meal.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  final List<Meal> _availableMeals;
  final Function _toggleFavorite ;
  final Function _isFavoriteMeal;

  CategoriesScreen(this._availableMeals,this._toggleFavorite,this._isFavoriteMeal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((data)=>
          CategoryItem(data.id,data.title,data.color,_availableMeals,_toggleFavorite,_isFavoriteMeal)
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      ),
    );
  }
}
