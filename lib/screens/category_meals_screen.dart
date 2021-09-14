import 'package:flutter/material.dart';
import 'package:cook/models/Meal.dart';
import 'package:cook/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> _availableMeals;
  final Function _toggleFavorite ;
  final Function _isFavoriteMeal;

  CategoryMealsScreen(this._availableMeals,this._toggleFavorite,this._isFavoriteMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {


  @override
  Widget build(BuildContext context) {

    final routArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId=routArgs['id'];
    final categoryTitle=routArgs['title'];
    final categoryMeals= widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body:  ListView.builder(
        itemBuilder: (context,index){
           return MealItem(
             id: categoryMeals[index].id,
             imageUrl:  categoryMeals[index].imageUrl,
             title: categoryMeals[index].title,
             duration: categoryMeals[index].duration,
             complexity: categoryMeals[index].complexity,
             affordability: categoryMeals[index].affordability,
             toggleFavorite: widget._toggleFavorite,
             isFavoriteMeal : widget._isFavoriteMeal
           );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
