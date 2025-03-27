import 'package:calories_tracker/Features/Meal%20DB/Presentation/widgets/category_screen_body.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const routeName = '/categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Meal Categories',
            style: Styles.styleBold19(context).copyWith(color: Colors.black),
          ),
        ),
        body: const CategoryScreenBody());
  }
}
