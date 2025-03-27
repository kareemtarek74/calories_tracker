import 'package:dartz/dartz.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:kareem_tarek/core/Errors/failure.dart';

class GetMealDetailsUseCase {
  final MealDBRepository _repository;

  GetMealDetailsUseCase(this._repository);

  Future<Either<Failure, MealDBEntity>> call(String mealId) async {
    return await _repository.getMealDetails(mealId);
  }
}
