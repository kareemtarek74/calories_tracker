import 'package:calories_tracker/Features/Presentation/widgets/meal_list_screen_body.dart';
import 'package:flutter/material.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({super.key});
  static const routeName = '/meal-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: MealListScreenBody());
  }
}
