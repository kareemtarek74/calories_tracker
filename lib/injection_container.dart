import 'package:calories_tracker/Features/Data/Repos/meal_repository_impl.dart';
import 'package:calories_tracker/Features/Domain/Repos/meal_repository.dart';
import 'package:calories_tracker/Features/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
final serviceLocator = sl;

Future<void> init() async {
  //! Core

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
