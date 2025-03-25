import 'package:calories_tracker/Features/Data/Repos/meal_repository_impl.dart';
import 'package:calories_tracker/Features/Data/models/meal_model.dart';
import 'package:calories_tracker/Features/Domain/Repos/meal_repository.dart';
import 'package:calories_tracker/Features/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;
final serviceLocator = sl;

Future<void> init() async {
  //! Core
  await Hive.initFlutter();
  Hive.registerAdapter(MealAdapter());
  await Hive.openBox<Meal>('meals');
  //! External

  //! ############################### Service ###############################

  //! ################################ Datasources #################################

  //! ################################# Repository #################################
  serviceLocator
      .registerLazySingleton<MealRepository>(() => MealRepositoryImpl());
  //! ################################# Usecases #################################

  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => MealCubit(sl()));
}
