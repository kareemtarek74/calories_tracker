import 'package:calories_tracker/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/widgets/meal_search_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealSearchScreen extends StatelessWidget {
  const MealSearchScreen({super.key});
  static const routeName = '/meal-search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MealDBCubit(),
      child: MealSearchScreenBody(),
    );
  }
}
