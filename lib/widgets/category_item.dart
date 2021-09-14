import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:cook/models/Meal.dart';
import 'package:cook/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final List<Meal> _availableMeals;
  final Function _toggleFavorite ;
  final Function _isFavoriteMeal;

  CategoryItem(this.id, this.title, this.color,this._availableMeals,this._toggleFavorite,this._isFavoriteMeal);

  selectCategory(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new CategoryMealsScreen(_availableMeals,_toggleFavorite,_isFavoriteMeal),
      settings: RouteSettings(
        arguments:
        {
          'id': id,
          'title':title
        }),

    )
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.4),
                  color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );

  }


}
