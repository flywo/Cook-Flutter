import 'package:flutter/material.dart';
import 'package:cook/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  MainDrawer(this.currentFilters,this.saveFilters);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ) ,
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text("Meal",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            onTap: ()=> Navigator.of(context).pushNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 26,),
            title: Text("Filters",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new FiltersScreen(currentFilters, saveFilters)));
            } ,
          )
        ],
      ),
    );
  }
}
