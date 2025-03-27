import 'package:calories_tracker/Features/Local%20Meals/Data/Repos/meal_repository_impl.dart';
import 'package:calories_tracker/Features/Local%20Meals/Data/models/meal_model.dart';
import 'package:calories_tracker/Features/Local%20Meals/Domain/Repos/meal_repository.dart';
import 'package:calories_tracker/Features/Local%20Meals/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:calories_tracker/Features/Main/presentation/cubits/buttom_navigation_cubit.dart';
import 'package:calories_tracker/Features/Meal%20DB/Data/Repos/meal_db_repository_impl.dart';
import 'package:calories_tracker/Features/Meal%20DB/Data/data_sources/meal_db_local_data_source.dart';
import 'package:calories_tracker/Features/Meal%20DB/Data/data_sources/meal_db_remote_data_source.dart';
import 'package:calories_tracker/Features/Meal%20DB/Data/models/meal_db_models.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/Repos/meal_db_repository.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/get_categories_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/get_meal_details_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/get_meals_by_category_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Domain/UseCases/search_meals_use_case.dart';
import 'package:calories_tracker/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:calories_tracker/core/Api/end_points.dart';
import 'package:calories_tracker/core/Api/http_service.dart';
import 'package:calories_tracker/core/Api/http_service_impl.dart';
import 'package:calories_tracker/core/Errors/failure_handler.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

BaseOptions _dioOptions() {
  return BaseOptions(
    baseUrl: EndPoints.baseUrl,
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
    sendTimeout: const Duration(seconds: 50),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    validateStatus: (status) => status != null && status <= 500,
  );
}

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MealAdapter());
  Hive.registerAdapter(MealDBEntityAdapter());
  Hive.registerAdapter(MealDBCategoryAdapter());
  await Hive.openBox<Meal>('meals');
  await Hive.openBox('meal_db_cache');

  //! External
  sl.registerLazySingleton(() => Dio(_dioOptions()));
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));

  //! Services
  sl.registerLazySingleton<FailureHandler>(() => FailureHandler());
  sl.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  //! DataSources
  sl.registerLazySingleton<MealDBRemoteDataSource>(
    () => MealDBRemoteDataSourceImpl(sl<Dio>()),
  );
  sl.registerLazySingleton<MealDBLocalDataSource>(
    () => MealDBLocalDataSourceImpl(),
  );

  //! Repositories
  sl.registerLazySingleton<MealRepository>(() => MealRepositoryImpl());
  sl.registerLazySingleton<MealDBRepository>(
    () => MealDBRepositoryImpl(
      remoteDataSource: sl<MealDBRemoteDataSource>(),
      failureHandler: sl<FailureHandler>(),
      localDataSource: sl<MealDBLocalDataSource>(),
    ),
  );

  //! Use Cases
  sl.registerLazySingleton(() => SearchMealsUseCase(sl<MealDBRepository>()));
  sl.registerLazySingleton(
      () => GetMealsByCategoryUseCase(sl<MealDBRepository>()));
  sl.registerLazySingleton(() => GetMealDetailsUseCase(sl<MealDBRepository>()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl<MealDBRepository>()));

  //! Cubits
  sl.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());
  sl.registerFactory(() => MealCubit(sl<MealRepository>()));
  sl.registerFactory(() => MealDBCubit());
}
