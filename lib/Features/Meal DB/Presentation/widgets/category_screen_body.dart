import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/screens/category_meals_screen.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/category_item.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/category_shimmer_item.dart';

class CategoryScreenBody extends StatelessWidget {
  const CategoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDBCubit, MealDBState>(
      builder: (context, state) {
        if (state is MealDBLoading) {
          return CategoryShimmerItem();
        } else if (state is MealDBError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is MealDBCategoriesLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return CategoryItem(
                category: category,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) =>
                            MealDBCubit()..getMealsByCategory(category.name),
                        child: CategoryMealsScreen(category: category.name),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
