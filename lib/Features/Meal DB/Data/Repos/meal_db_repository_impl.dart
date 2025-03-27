import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Data/data_sources/meal_db_local_data_source.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Data/data_sources/meal_db_remote_data_source.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:kareem_tarek/core/Errors/failure.dart';
import 'package:kareem_tarek/core/Errors/failure_handler.dart';

class MealDBRepositoryImpl implements MealDBRepository {
  final MealDBRemoteDataSource _remoteDataSource;
  final MealDBLocalDataSource _localDataSource;
  final FailureHandler _failureHandler;

  MealDBRepositoryImpl({
    required MealDBRemoteDataSource remoteDataSource,
    required MealDBLocalDataSource localDataSource,
    required FailureHandler failureHandler,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _failureHandler = failureHandler;

  @override
  Future<Either<Failure, List<MealDBEntity>>> searchMeals(String query,
      {int page = 1}) async {
    try {
      final meals = await _remoteDataSource.searchMeals(query, page: page);
      return Right(meals);
    } on DioException catch (e) {
      return Left(_failureHandler.handle(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealDBEntity>>> getMealsByCategory(
      String category,
      {int page = 1}) async {
    try {
      final cached = _localDataSource.getCachedMealsByCategory(category);
      if (cached != null && cached.isNotEmpty) return Right(cached);

      final meals =
          await _remoteDataSource.getMealsByCategory(category, page: page);
      await _localDataSource.cacheMealsByCategory(category, meals);
      return Right(meals);
    } on DioException catch (e) {
      return Left(_failureHandler.handle(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MealDBEntity>> getMealDetails(String id) async {
    try {
      final cached = _localDataSource.getCachedMealDetails(id);
      if (cached != null) return Right(cached);

      final meal = await _remoteDataSource.getMealDetails(id);
      await _localDataSource.cacheMealDetails(id, meal);
      return Right(meal);
    } on DioException catch (e) {
      return Left(_failureHandler.handle(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealDBCategory>>> getCategories() async {
    try {
      final cached = _localDataSource.getCachedCategories();
      if (cached != null && cached.isNotEmpty) return Right(cached);

      final categories = await _remoteDataSource.getCategories();
      await _localDataSource.cacheCategories(categories);
      return Right(categories);
    } on DioException catch (e) {
      return Left(_failureHandler.handle(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
