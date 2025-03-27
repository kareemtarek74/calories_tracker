import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Domain/Entities/meal_entity.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/custom_meal_item.dart';

class CustomMealListView extends StatelessWidget {
  final List<MealEntity> meals;

  const CustomMealListView({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MealCubit>(context);

    return NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          double threshold = scrollInfo.metrics.maxScrollExtent * 0.7;
          if (scrollInfo.metrics.pixels >= threshold &&
              cubit.hasMoreData &&
              !cubit.isLoadingMore) {
            cubit.fetchMeals(loadMore: true);
          }
          return false;
        },
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: meals.length + (cubit.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < meals.length) {
              return CustomMealItem(
                meal: meals[index],
                onDelete: () {
                  cubit.deleteMeal(index);
                },
              );
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}
