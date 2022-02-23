import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/drawer.dart';
import 'category_screen.dart';
import 'fav_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal>favMeals;

 TabsScreen( this.favMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
List<Map<String, Object>>_page ;
  int _selectPageIndex = 0;

  @override
  void initState(){
    _page = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavScreen(widget.favMeals),
        'title': 'Favorites',
      },
    ];
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_page[_selectPageIndex]['title']),
        ),
        body: _page[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap:_selectPage ,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor:Colors.white,
          backgroundColor:Theme.of(context).primaryColor,
          currentIndex: _selectPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }

}
