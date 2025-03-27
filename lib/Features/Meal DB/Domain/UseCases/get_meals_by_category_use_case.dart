import 'package:dartz/dartz.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:kareem_tarek/core/Errors/failure.dart';

class GetMealsByCategoryUseCase {
  final MealDBRepository _repository;

  GetMealsByCategoryUseCase(this._repository);

  Future<Either<Failure, List<MealDBEntity>>> call(String category,
      {int page = 1}) async {
    return await _repository.getMealsByCategory(category, page: page);
  }
}
