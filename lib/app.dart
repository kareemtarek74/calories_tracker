import 'package:calories_tracker/Features/Main/presentation/views/main_view.dart';
import 'package:calories_tracker/config/locale/app_localizations_setup.dart';
import 'package:calories_tracker/core/helper_functions/on_generate_function.dart';
import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:calories_tracker/core/widgets/app_wrapper.dart';
import 'package:flutter/material.dart';

class CaloriesTracker extends StatelessWidget {
  const CaloriesTracker({super.key});
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
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
        initialRoute: MainView.routeName,
      ),
    );
  }
}
