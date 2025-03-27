import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/add_meal_screen_body.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});
  static const routeName = '/add-meal';

  @override
  Widget build(BuildContext context) {
    return AddMealScreenBody();
  }
}
