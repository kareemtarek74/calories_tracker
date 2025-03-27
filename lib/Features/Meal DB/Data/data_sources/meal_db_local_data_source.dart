import 'package:calories_tracker/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:hive/hive.dart';

abstract class MealDBLocalDataSource {
  Future<void> cacheCategories(List<MealDBCategory> categories);
  List<MealDBCategory>? getCachedCategories();

  Future<void> cacheMealsByCategory(String category, List<MealDBEntity> meals);
  List<MealDBEntity>? getCachedMealsByCategory(String category);

  Future<void> cacheMealDetails(String id, MealDBEntity meal);
  MealDBEntity? getCachedMealDetails(String id);
}

class MealDBLocalDataSourceImpl implements MealDBLocalDataSource {
  final Box _box = Hive.box('meal_db_cache');

  @override
  Future<void> cacheCategories(List<MealDBCategory> categories) async {
    await _box.put('categories', categories);
  }

  @override
  List<MealDBCategory>? getCachedCategories() {
    return _box.get('categories')?.cast<MealDBCategory>();
  }

  @override
  Future<void> cacheMealsByCategory(
      String category, List<MealDBEntity> meals) async {
    await _box.put('category_$category', meals);
  }

  @override
  List<MealDBEntity>? getCachedMealsByCategory(String category) {
    return _box.get('category_$category')?.cast<MealDBEntity>();
  }

  @override
  Future<void> cacheMealDetails(String id, MealDBEntity meal) async {
    await _box.put('meal_$id', meal);
  }

  @override
  MealDBEntity? getCachedMealDetails(String id) {
    return _box.get('meal_$id') as MealDBEntity?;
  }
}
