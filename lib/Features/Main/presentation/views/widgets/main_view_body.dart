import 'package:calories_tracker/Features/Local%20Meals/Presentation/screens/meal_list_screen.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/screens/categories_screen.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/screens/meal_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    switch (currentViewIndex) {
      case 0:
        return const MealListScreen();
      case 1:
        return const MealSearchScreen();
      case 2:
        return BlocProvider(
          create: (_) => MealDBCubit()..getCategories(),
          child: const CategoriesScreen(),
        );

      default:
        return const MealListScreen();
    }
  }
}
