import 'package:flutter/material.dart';
import 'package:cook/models/Meal.dart';
import 'package:cook/widgets/meal_item.dart';


class FavoritesScreen extends StatelessWidget {

  final List<Meal> _favoriteMeals;
  final Function _toggleFavorite ;
  final Function _isFavoriteMeal;

  FavoritesScreen(this._favoriteMeals,this._toggleFavorite,this._isFavoriteMeal);

  @override
  Widget build(BuildContext context) {

    if(_favoriteMeals.isEmpty) {
      return Center(
        child: Container(
          child: Text("You haven't favorite yet - start adding some!"),
        ),
      );
      }
    else
      {
        return ListView.builder(
          itemBuilder: (context,index){
            return MealItem(
              id: _favoriteMeals[index].id,
              imageUrl:  _favoriteMeals[index].imageUrl,
              title: _favoriteMeals[index].title,
              duration: _favoriteMeals[index].duration,
              complexity: _favoriteMeals[index].complexity,
              affordability: _favoriteMeals[index].affordability,
                toggleFavorite: _toggleFavorite,
                isFavoriteMeal : _isFavoriteMeal
            );
          },
          itemCount: _favoriteMeals.length,
        );
      }
  }
}
