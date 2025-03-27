import 'package:calories_tracker/Features/Meal%20DB/Presentation/widgets/category_meals_screen_body.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key, required this.category});
  final String category;
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Meals in $category',
            style: Styles.styleBold19(context).copyWith(color: Colors.black),
          ),
        ),
        body: CategoryMealsScreenBody(category: category));
  }
}
