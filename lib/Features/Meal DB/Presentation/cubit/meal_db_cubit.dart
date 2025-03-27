import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calories_tracker/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/get_categories_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/get_meal_details_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/get_meals_by_category_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/search_meals_use_case.dart';
import 'package:calories_tracker/core/Errors/failure.dart';
import 'package:calories_tracker/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'meal_db_state.dart';

class MealDBCubit extends Cubit<MealDBState> {
  Timer? _debounceTimer;
  final SearchMealsUseCase _searchMealsUseCase = sl<SearchMealsUseCase>();
  final GetMealsByCategoryUseCase _getMealsByCategoryUseCase =
      sl<GetMealsByCategoryUseCase>();
  final GetMealDetailsUseCase _getMealDetailsUseCase =
      sl<GetMealDetailsUseCase>();
  final GetCategoriesUseCase _getCategoriesUseCase = sl<GetCategoriesUseCase>();

  List<MealDBEntity> _allMeals = [];
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _hasMore = true;
  String? _currentCategory;
  String? _currentQuery;

  MealDBCubit() : super(MealDBInitial());

  void searchMeals(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      _currentQuery = query;
      _currentCategory = null;
      _currentPage = 1;
      _hasMore = true;
      if (!isClosed) emit(MealDBLoading());

      final result = await _searchMealsUseCase(query, page: _currentPage);
      if (!isClosed) _handleSearchResult(result);
    });
  }

  void getMealsByCategory(String category) async {
    _currentCategory = category;
    _currentQuery = null;
    _currentPage = 1;
    _hasMore = true;
    if (!isClosed) emit(MealDBLoading());

    final result =
        await _getMealsByCategoryUseCase(category, page: _currentPage);
    if (!isClosed) _handleCategoryMealsResult(result, category);
  }

  void loadMore() async {
    if (!_hasMore || state is MealDBLoadingMore) return;

    if (!isClosed) emit(MealDBLoadingMore());
    _currentPage++;

    try {
      if (_currentQuery != null) {
        final result =
            await _searchMealsUseCase(_currentQuery!, page: _currentPage);
        if (!isClosed) _handleSearchResult(result, isLoadMore: true);
      } else if (_currentCategory != null) {
        final result = await _getMealsByCategoryUseCase(_currentCategory!,
            page: _currentPage);
        if (!isClosed) {
          _handleCategoryMealsResult(result, _currentCategory!,
              isLoadMore: true);
        }
      }
    } catch (e) {
      if (!isClosed) emit(MealDBError(message: 'Failed to load more items'));
    }
  }

  void _handleSearchResult(Either<Failure, List<MealDBEntity>> result,
      {bool isLoadMore = false}) {
    result.fold(
      (failure) {
        if (!isClosed) emit(MealDBError(message: failure.message));
      },
      (newMeals) {
        if (!isClosed) {
          if (isLoadMore) {
            _allMeals.addAll(newMeals);
          } else {
            _allMeals = newMeals;
          }
          _hasMore = newMeals.length == _itemsPerPage;
          emit(MealDBSearchLoaded(_allMeals, hasMore: _hasMore));
        }
      },
    );
  }

  void _handleCategoryMealsResult(
      Either<Failure, List<MealDBEntity>> result, String category,
      {bool isLoadMore = false}) {
    result.fold(
      (failure) {
        if (!isClosed) emit(MealDBError(message: failure.message));
      },
      (newMeals) {
        if (!isClosed) {
          if (isLoadMore) {
            _allMeals.addAll(newMeals);
          } else {
            _allMeals = newMeals;
          }
          _hasMore = newMeals.length == _itemsPerPage;
          emit(MealDBCategoryLoaded(_allMeals, category, hasMore: _hasMore));
        }
      },
    );
  }

  void getMealDetails(String mealId) async {
    if (!isClosed) emit(MealDBLoading());
    final result = await _getMealDetailsUseCase(mealId);
    if (!isClosed) _handleMealDetailsResult(result);
  }

  void _handleMealDetailsResult(Either<Failure, MealDBEntity> result) {
    result.fold(
      (failure) {
        if (!isClosed) emit(MealDBError(message: failure.message));
      },
      (meal) {
        if (!isClosed) emit(MealDBDetailsLoaded(meal));
      },
    );
  }

  void getCategories() async {
    if (!isClosed) emit(MealDBLoading());
    final result = await _getCategoriesUseCase();
    if (!isClosed) _handleCategoriesResult(result);
  }

  void _handleCategoriesResult(Either<Failure, List<MealDBCategory>> result) {
    result.fold(
      (failure) {
        if (!isClosed) emit(MealDBError(message: failure.message));
      },
      (categories) {
        if (!isClosed) emit(MealDBCategoriesLoaded(categories));
      },
    );
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
