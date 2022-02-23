import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/category_meal_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _setFilters(Map<String, bool> _filtersData){
    setState(() {
      _filters = _filtersData;
      
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten']&& !meal.isGlutenFree){
          return false;
        };
        if(_filters['lactose']&& !meal.isLactoseFree){
          return false;
        };
        if(_filters['vegan']&& !meal.isVegan){
          return false;
        };if(_filters['vegetarian']&& !meal.isVegetarian){
          return false;
        };
        return true;
        }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final exitingIndex = _favMeals.indexWhere((meal) => meal.id == mealId);

    if(exitingIndex>=0){
      setState(() {
        _favMeals.removeAt(exitingIndex);
      });
    }
    else{
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
    
  }

  bool _isMealFavorite(String id){
    return _favMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
            ),
      ),
      //home: const MyHomePage()

      routes: {
        '/': (context) => TabsScreen(_favMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters,_filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meal App'),
        ),
        body: null,
      ),
    );
  }
}
