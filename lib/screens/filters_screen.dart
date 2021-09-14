import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters , this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState()
  {
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }
  Widget buildSwitchListTile(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title), value: currentValue, onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final Map<String,bool> selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian
              };
              widget.saveFilters(selectedFilters);
              },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 26),
            ),
          ),
          buildSwitchListTile(
            "Gluten-Free",
            _glutenFree,
            (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          buildSwitchListTile(
            "Lactose-Free",
            _lactoseFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          buildSwitchListTile(
            "Vegan",
            _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
          buildSwitchListTile(
            "Vegetarian",
            _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),

        ],
      ),
    );
  }
}
