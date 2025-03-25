import 'package:calories_tracker/Features/Domain/Entities/meal_entity.dart';

abstract class MealRepository {
  Future<List<MealEntity>> getMeals({int offset, int limit});
  Future<void> addMeal(MealEntity meal);
  Future<void> deleteMeal(int index);
}
