import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/screens/add_meal_screen.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/screens/meal_list_screen.dart';
import 'package:kareem_tarek/Features/Main/presentation/views/main_view.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/screens/categories_screen.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/screens/category_meals_screen.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/screens/meal_details_screen.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/screens/meal_search_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case MealListScreen.routeName:
      return MaterialPageRoute(builder: (_) => const MealListScreen());
    case AddMealScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AddMealScreen());
    case MealSearchScreen.routeName:
      return MaterialPageRoute(builder: (_) => const MealSearchScreen());
    case CategoriesScreen.routeName:
      return MaterialPageRoute(builder: (_) => const CategoriesScreen());
    case CategoryMealsScreen.routeName:
      final categoryName = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryMealsScreen(category: categoryName),
      );
    case MealDetailsScreen.routeName:
      final mealId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => MealDetailsScreen(mealId: mealId),
      );
    default:
      return MaterialPageRoute(builder: (_) => const MainView());
  }
}
