import 'package:calories_tracker/Features/Presentation/screens/add_meal_screen.dart';
import 'package:calories_tracker/Features/Presentation/screens/meal_list_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MealListScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MealListScreen());
    case AddMealScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AddMealScreen());
    default:
      return MaterialPageRoute(builder: (context) => const MealListScreen());
  }
}
