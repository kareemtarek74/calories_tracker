import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Domain/Entities/meal_entity.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Domain/Repos/meal_repository.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final MealRepository repository;
  List<MealEntity> allMeals = [];
  bool hasMoreData = true;
  bool isLoadingMore = false;
  static const int pageSize = 10;
  String currentSortBy = 'time';

  MealCubit(this.repository) : super(MealInitial());

  Future<void> fetchMeals(
      {bool loadMore = false, String sortBy = 'time'}) async {
    if (loadMore) {
      if (!hasMoreData || isLoadingMore) return;
      isLoadingMore = true;
      emit(MealLoadingMore());
    } else {
      emit(MealLoading());
    }

    try {
      final newMeals =
          await repository.getMeals(offset: allMeals.length, limit: pageSize);

      if (newMeals.isEmpty) {
        hasMoreData = false;
      } else {
        allMeals.addAll(newMeals);
        hasMoreData = newMeals.length == pageSize;
      }

      _sortMeals(sortBy);

      isLoadingMore = false;
      emit(MealLoaded(allMeals, _calculateTotalCalories(allMeals)));
    } catch (e) {
      isLoadingMore = false;
      emit(MealError(message: 'Failed to load meals: $e'));
    }
  }

  Future<void> addMeal(MealEntity meal) async {
    try {
      await repository.addMeal(meal);
      allMeals.insert(0, meal);
      _sortMeals(currentSortBy);

      emit(MealLoaded(List.from(allMeals), _calculateTotalCalories(allMeals)));
    } catch (e) {
      emit(MealError(message: 'Failed to add meal: $e'));
    }
  }

  Future<void> deleteMeal(int index) async {
    try {
      await repository.deleteMeal(index);

      allMeals.removeAt(index);

      emit(MealLoaded(List.from(allMeals), _calculateTotalCalories(allMeals)));
    } catch (e) {
      emit(MealError(message: 'Failed to delete meal: $e'));
    }
  }

  void _sortMeals(String sortBy) {
    if (sortBy == 'name') {
      allMeals.sort((a, b) => a.name.compareTo(b.name));
    } else if (sortBy == 'calories') {
      allMeals.sort((a, b) => a.calories.compareTo(b.calories));
    } else {
      allMeals.sort((a, b) => a.time.compareTo(b.time));
    }
  }

  int _calculateTotalCalories(List<MealEntity> meals) {
    return meals.fold(0, (sum, meal) => sum + meal.calories);
  }
}
