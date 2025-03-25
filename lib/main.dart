import 'package:calories_tracker/app.dart';
import 'package:calories_tracker/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/Data/models/meal_model.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MealAdapter());
  await Hive.openBox<Meal>('meals');
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const CaloriesTracker());
}
