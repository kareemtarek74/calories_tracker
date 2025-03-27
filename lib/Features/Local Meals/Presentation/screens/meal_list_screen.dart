import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/meal_list_screen_body.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({super.key});
  static const routeName = '/meal-list';
  @override
  Widget build(BuildContext context) {
    return MealListScreenBody();
  }
}
