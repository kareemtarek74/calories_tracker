import 'package:calories_tracker/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/screens/meal_details_screen.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/widgets/meal_db_item.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/widgets/meal_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryMealsScreenBody extends StatefulWidget {
  final String category;

  const CategoryMealsScreenBody({
    super.key,
    required this.category,
  });

  @override
  State<CategoryMealsScreenBody> createState() =>
      _CategoryMealsScreenBodyState();
}

class _CategoryMealsScreenBodyState extends State<CategoryMealsScreenBody> {
  final ScrollController _scrollController = ScrollController();
  late MealDBCubit cubit;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      cubit.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDBCubit, MealDBState>(
      builder: (context, state) {
        if (state is MealDBLoading) {
          return MealShimmerItem();
        } else if (state is MealDBError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is MealDBCategoryLoaded &&
            state.category == widget.category) {
          if (state.meals.isEmpty) {
            return const Center(child: Text('No meals found in this category'));
          }
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.meals.length + (state.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.meals.length) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return MealDBItem(
                meal: state.meals[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MealDetailsScreen.routeName,
                    arguments: state.meals[index].id,
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
