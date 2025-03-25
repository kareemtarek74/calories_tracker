import 'package:calories_tracker/Features/Presentation/widgets/add_meal_screen_body.dart';
import 'package:flutter/material.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});
  static const routeName = '/add-meal';

  @override
  Widget build(BuildContext context) {
    return AddMealScreenBody();
  }
}
