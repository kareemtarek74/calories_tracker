import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:calories_tracker/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

class SearchMealsUseCase {
  final MealDBRepository _repository;

  SearchMealsUseCase(this._repository);

  Future<Either<Failure, List<MealDBEntity>>> call(String query,
      {int page = 1}) async {
    return await _repository.searchMeals(query, page: page);
  }
}
