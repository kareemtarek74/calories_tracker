import 'package:dartz/dartz.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:kareem_tarek/core/Errors/failure.dart';

class GetCategoriesUseCase {
  final MealDBRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<Either<Failure, List<MealDBCategory>>> call() async {
    return await _repository.getCategories();
  }
}
