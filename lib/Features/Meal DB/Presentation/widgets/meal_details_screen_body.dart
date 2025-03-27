import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/custom_error_widget.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/cubit/meal_db_cubit.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/details_body.dart';
import 'package:kareem_tarek/Features/Meal%20DB/Presentation/widgets/meal_details_shimmer.dart';

class MealDetailsScreenBody extends StatefulWidget {
  final String mealId;

  const MealDetailsScreenBody({
    super.key,
    required this.mealId,
  });

  @override
  State<MealDetailsScreenBody> createState() => _MealDetailsScreenBodyState();
}

class _MealDetailsScreenBodyState extends State<MealDetailsScreenBody> {
  late MealDBCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<MealDBCubit>(context)
      ..getMealDetails(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDBCubit, MealDBState>(
      builder: (context, state) {
        if (state is MealDBLoading) {
          return MealDetailsShimmer();
        } else if (state is MealDBError) {
          return CustomErrorWidget(
            errorMessage: state.message,
            onRetry: () => cubit.getMealDetails(widget.mealId),
          );
        } else if (state is MealDBDetailsLoaded) {
          final meal = state.meal;
          return DetailsBody(meal: meal);
        }
        return const SizedBox();
      },
    );
  }
}
