import 'package:hive/hive.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Data/models/meal_model.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Domain/Entities/meal_entity.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Domain/Repos/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final Box<Meal> mealsBox = Hive.box<Meal>('meals');

  @override
  Future<List<MealEntity>> getMeals({int offset = 0, int limit = 10}) async {
    final meals = mealsBox.values
        .skip(offset)
        .take(limit)
        .map((meal) => meal.toEntity())
        .toList();
    return Future.value(meals);
  }

  @override
  Future<void> addMeal(MealEntity meal) async {
    await mealsBox.add(Meal.fromEntity(meal));
  }

  @override
  Future<void> deleteMeal(int index) async {
    await mealsBox.deleteAt(index);
  }
}
