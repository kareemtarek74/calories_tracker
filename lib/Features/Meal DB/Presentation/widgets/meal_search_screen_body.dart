import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/custom_error_widget.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/screens/meal_details_screen.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/empty_search_result_widget.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/meal_db_item.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/meal_shimmer_item.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/search_initial_widget.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/search_meals_app_bar.dart';
import 'package:kareem_tarek/core/utils/app_colors.dart';

class MealSearchScreenBody extends StatefulWidget {
  const MealSearchScreenBody({super.key});

  @override
  State<MealSearchScreenBody> createState() => _MealSearchScreenBodyState();
}

class _MealSearchScreenBodyState extends State<MealSearchScreenBody> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late MealDBCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<MealDBCubit>(context);
    _scrollController.addListener(_onScroll);

    _searchController.addListener(() {
      final query = _searchController.text;
      if (query.length >= 2) {
        _cubit.searchMeals(query);
      } else if (query.isEmpty) {
        _cubit.emit(MealDBInitial());
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      _cubit.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: SearchAppBar(
        controller: _searchController,
        onClear: () {
          _searchController.clear();
          _cubit.emit(MealDBInitial());
        },
        onSearch: (value) {
          if (value.isNotEmpty) {
            _cubit.searchMeals(value);
          }
        },
      ),
      body: BlocBuilder<MealDBCubit, MealDBState>(
        builder: (context, state) {
          if (state is MealDBInitial) {
            return const SearchInitialWidget();
          } else if (state is MealDBLoading) {
            return const MealShimmerItem();
          } else if (state is MealDBError) {
            return CustomErrorWidget(
              errorMessage: state.message,
              onRetry: () {
                if (_searchController.text.isNotEmpty) {
                  _cubit.searchMeals(_searchController.text);
                }
              },
            );
          } else if (state is MealDBSearchLoaded) {
            if (state.meals.isEmpty) {
              return const EmptySearchResultWidget();
            }

            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: state.meals.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.meals.length) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return Column(
                  children: [
                    MealDBItem(
                      meal: state.meals[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MealDetailsScreen.routeName,
                          arguments: state.meals[index].id,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
