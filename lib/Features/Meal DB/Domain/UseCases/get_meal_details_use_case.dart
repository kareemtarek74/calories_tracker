import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:calories_tracker/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

class GetMealDetailsUseCase {
  final MealDBRepository _repository;

  GetMealDetailsUseCase(this._repository);

  Future<Either<Failure, MealDBEntity>> call(String mealId) async {
    return await _repository.getMealDetails(mealId);
  }
}
