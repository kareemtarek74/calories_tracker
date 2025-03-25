import 'package:calories_tracker/Features/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:calories_tracker/Features/Presentation/screens/meal_list_screen.dart';
import 'package:calories_tracker/config/locale/app_localizations_setup.dart';
import 'package:calories_tracker/core/helper_functions/on_generate_function.dart';
import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:calories_tracker/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaloriesTracker extends StatelessWidget {
  const CaloriesTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MealCubit>()..fetchMeals(),
      child: MaterialApp(
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
        locale: Locale('en'),
        theme: ThemeData(
          fontFamily: 'DM Sans',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: MealListScreen.routeName,
      ),
    );
  }
}
