import 'package:flutter/material.dart';
import 'package:cook/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  final Function toggleFavorite;
  final Function isFavoriteMeal;

  MealDetailScreen(this.toggleFavorite ,this.isFavoriteMeal);

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text("Ingredients"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                  itemBuilder: (context,index)=> Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text("Steps"),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                  itemBuilder: (context,index)=> Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index+1}"),
                        ),
                      ),
                      Text(selectedMeal.steps[index]),
                      Divider()
                    ],
                  ),
                  itemCount: selectedMeal.steps.length
              ),
            ),
          ],
        ),
      ),

        floatingActionButton: FloatingActionButton(
        child: Icon(isFavoriteMeal(mealId)? Icons.star : Icons.star_border),
          onPressed: () => toggleFavorite(mealId),
    ),
    );
  }
}
