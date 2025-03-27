import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:kareem_tarek/injection_container.dart' as di;

class AppWrapper extends StatelessWidget {
  final Widget child;
  const AppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<MealDBCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<MealCubit>()..fetchMeals(),
        )
      ],
      child: child,
    );
  }
}
