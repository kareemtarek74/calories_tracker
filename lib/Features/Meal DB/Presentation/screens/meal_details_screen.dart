import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/meal_details_screen_body.dart';
import 'package:kareem_tarek/core/text_styles.dart';
import 'package:kareem_tarek/core/utils/app_colors.dart';

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
