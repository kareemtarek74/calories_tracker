import 'package:calories_tracker/Features/Domain/Entities/meal_entity.dart';
import 'package:calories_tracker/Features/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:calories_tracker/Features/Presentation/widgets/custom_error_widget.dart';
import 'package:calories_tracker/Features/Presentation/widgets/custom_meal_list_view.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:calories_tracker/core/widgets/custom_empty_widget.dart';
import 'package:calories_tracker/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomMealListBody extends StatelessWidget {
  final String filter;

  const CustomMealListBody({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoaded) {
          List<MealEntity> filteredMeals = List.from(state.meals);

          if (filter == 'time') {
            filteredMeals.sort((a, b) => a.time.compareTo(b.time));
          } else if (filter == 'name') {
            filteredMeals.sort((a, b) => a.name.compareTo(b.name));
          } else if (filter == 'calories') {
            filteredMeals.sort((a, b) => a.calories.compareTo(b.calories));
          }

          if (filteredMeals.isEmpty) {
            return const CustomEmptyWidget(
              icon: FontAwesomeIcons.utensils,
              title: "No meals added yet!",
              subtitle: "Tap the add button to start tracking your meals.",
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Text(
                      'Total Calories Today: ${state.totalCalories}',
                      style: Styles.styleBold16(context).copyWith(
                        color: const Color(0x9924252C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .9,
                child: CustomMealListView(meals: filteredMeals),
              ),
            ],
          );
        } else if (state is MealError) {
          return SizedBox.expand(
            child: CustomErrorWidget(
              errorMessage: 'There is a problem, please try again',
              onRetry: () {
                context.read<MealCubit>().fetchMeals();
              },
            ),
          );
        } else {
          return Center(child: CustomProgressIndicator());
        }
      },
    );
  }
}
