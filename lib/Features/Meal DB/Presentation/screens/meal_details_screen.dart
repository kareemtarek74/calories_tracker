import 'package:calories_tracker/Features/Meal%20DB/Presentation/widgets/meal_details_screen_body.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealId});
  final String mealId;
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Meal Details',
            style: Styles.styleBold19(context).copyWith(color: Colors.black),
          ),
        ),
        body: MealDetailsScreenBody(mealId: mealId));
  }
}
