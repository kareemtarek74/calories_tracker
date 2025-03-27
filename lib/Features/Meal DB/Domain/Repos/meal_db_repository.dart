import 'package:calories_tracker/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:calories_tracker/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MealDBRepository {
  Future<Either<Failure, List<MealDBEntity>>> searchMeals(String query,
      {int page = 1});
  Future<Either<Failure, List<MealDBEntity>>> getMealsByCategory(
      String category,
      {int page = 1});
  Future<Either<Failure, MealDBEntity>> getMealDetails(String id);
  Future<Either<Failure, List<MealDBCategory>>> getCategories();
}
