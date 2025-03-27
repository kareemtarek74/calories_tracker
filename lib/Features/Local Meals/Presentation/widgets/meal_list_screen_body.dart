import 'package:calories_tracker/Features/Local%20Meals/Presentation/widgets/add_meal_floating_action_button.dart';
import 'package:calories_tracker/Features/Local%20Meals/Presentation/widgets/custom_meal_list_body.dart';
import 'package:calories_tracker/Features/Local%20Meals/Presentation/widgets/meal_list_app_bar.dart';
import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MealListScreenBody extends StatefulWidget {
  const MealListScreenBody({super.key});

  @override
  State<MealListScreenBody> createState() => _MealListScreenBodyState();
}

class _MealListScreenBodyState extends State<MealListScreenBody> {
  String selectedFilter = 'time';

  void updateFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MealListAppBar(onFilterSelected: updateFilter),
              CustomMealListBody(filter: selectedFilter),
            ],
          ),
        ),
      ),
    );
  }
}
