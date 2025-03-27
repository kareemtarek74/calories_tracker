import 'package:dio/dio.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:kareem_tarek/core/Api/end_points.dart';
import 'package:kareem_tarek/core/Errors/failure.dart';

abstract class MealDBRemoteDataSource {
  Future<List<MealDBEntity>> searchMeals(String query, {int page = 1});
  Future<List<MealDBEntity>> getMealsByCategory(String category,
      {int page = 1});
  Future<MealDBEntity> getMealDetails(String id);
  Future<List<MealDBCategory>> getCategories();
}

class MealDBRemoteDataSourceImpl implements MealDBRemoteDataSource {
  final Dio _dio;

  MealDBRemoteDataSourceImpl(this._dio);

  @override
  Future<List<MealDBEntity>> searchMeals(String query, {int page = 1}) async {
    try {
      final response = await _dio.get(
        ApiKeys.searchMeals,
        queryParameters: {'s': query},
      );

      if (response.data['meals'] == null) return [];

      return (response.data['meals'] as List)
          .map((meal) => MealDBEntity.fromJson(meal))
          .toList();
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MealDBEntity>> getMealsByCategory(String category,
      {int page = 1}) async {
    try {
      final response = await _dio.get(
        ApiKeys.getMealsByCategory,
        queryParameters: {'c': category},
      );

      if (response.data['meals'] == null) return [];

      final List<MealDBEntity> meals = [];
      for (var meal in response.data['meals']) {
        final details = await getMealDetails(meal['idMeal']);
        meals.add(details);
      }
      return meals;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<MealDBEntity> getMealDetails(String id) async {
    try {
      final response = await _dio.get(
        ApiKeys.getMealDetails,
        queryParameters: {'i': id},
      );

      return MealDBEntity.fromJson(response.data['meals'][0]);
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MealDBCategory>> getCategories() async {
    try {
      final response = await _dio.get(ApiKeys.getCategories);

      return (response.data['categories'] as List)
          .map((category) => MealDBCategory.fromJson(category))
          .toList();
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
