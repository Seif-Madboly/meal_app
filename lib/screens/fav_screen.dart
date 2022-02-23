import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favMeals;
  FavScreen(this.favMeals);
  @override
  Widget build(BuildContext context) {
    if(favMeals.isEmpty){
      return SafeArea(
        child: Center(
          child: Text("Favorites Meals"),
        ),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeals[index].id,
            imageUrl: favMeals[index].imageUrl,
            title: favMeals[index].title,
            duration: favMeals[index].duration,
            affordability: favMeals[index].affordability,
            complexity: favMeals[index].complexity,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
