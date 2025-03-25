import 'package:calories_tracker/Features/Presentation/widgets/add_meal_floating_action_button.dart';
import 'package:calories_tracker/Features/Presentation/widgets/custom_meal_list_body.dart';
import 'package:calories_tracker/Features/Presentation/widgets/meal_list_pp_bar.dart';
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
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, right: 16),
                      child: MealListAppBar(onFilterSelected: updateFilter),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: CustomMealListBody(filter: selectedFilter),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(bottom: 32, right: 0, child: CustomFloatingButton()),
        ],
      ),
    );
  }
}
