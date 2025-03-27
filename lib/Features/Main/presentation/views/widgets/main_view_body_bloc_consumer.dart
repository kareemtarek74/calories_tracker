import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:kareem_tarek/Features/Main/presentation/views/widgets/main_view_body.dart';
import 'package:kareem_tarek/injection_container.dart' as di;

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MealCubit>()..fetchMeals(),
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
