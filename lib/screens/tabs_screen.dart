import 'package:flutter/material.dart';
import 'package:cook/models/Meal.dart';
import 'package:cook/screens/CategoriesScreen.dart';
import 'package:cook/screens/favorites_screen.dart';
import 'package:cook/widgets/main_drawer.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TabsScreen extends StatefulWidget {

   final List<Meal> _favoriteMeals;
   final List<Meal> _availableMeals;
   final Function _toggleFavorite ;
   final Function _isFavoriteMeal;
   final Function saveFilters;
   final Map<String,bool> currentFilters;

  TabsScreen(this._favoriteMeals,this._availableMeals,this._toggleFavorite,this._isFavoriteMeal,this.currentFilters,this.saveFilters);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   List<Map<String,Object>> _pages ;

   bool isLoading = true;
   var futureBuilder;

   Future<String> getWebURL() async {
     MethodChannel channel = MethodChannel("FlutterCall");
     var result = await channel.invokeMethod('getAppType');
     print(result);
     if (result != "other") {
       result = await channel.invokeMethod('getWebURL');
       print(result);
       return result;
     } else {
       return "";
     }
   }

   @override
   initState()
   {
     _pages =
     [
       {
         'page' : CategoriesScreen(widget._availableMeals,widget._toggleFavorite,widget._isFavoriteMeal),
         'title' : 'Categories'
       },
       {
         'page' : FavoritesScreen(widget._favoriteMeals,widget._toggleFavorite,widget._isFavoriteMeal),
         'title' : 'Your Favorites'
       }
     ];

     super.initState();

     futureBuilder = getWebURL();
   }
  int _selectedPageIndex=0;
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBuilder,
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.connectionState == ConnectionState.done) {
          String data = snap.data;
          if (data != null && data.isNotEmpty) {
            Navigator.maybePop(context);
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: SafeArea(
                  child: Stack(
                    children: [
                      WebView(
                        userAgent: "sqd_ios",
                        initialUrl: data,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController webViewController) {
                          setState(() {
                            isLoading = true;
                          });
                        },
                        onPageStarted: (String url) {
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                      isLoading ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ) : Container()
                    ],
                  ),
                ),
              ),
            );
          }
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title']),
          ),
          body: _pages[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).accentColor ,
            unselectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                  icon:Icon( Icons.category),
                  label: "categories"
              ),
              BottomNavigationBarItem(
                  icon:Icon( Icons.favorite_border),
                  label: "Favorites"
              ),
            ],
          ),
          drawer: MainDrawer(widget.currentFilters,widget.saveFilters),
        );
      },
    );
  }


}
