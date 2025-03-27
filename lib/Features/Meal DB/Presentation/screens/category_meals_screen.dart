import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/category_meals_screen_body.dart';
import 'package:kareem_tarek/core/text_styles.dart';
import 'package:kareem_tarek/core/utils/app_colors.dart';

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
