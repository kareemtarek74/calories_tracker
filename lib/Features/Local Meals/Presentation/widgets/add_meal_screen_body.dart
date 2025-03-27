import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../cubits/Meal Cubit/meal_cubit.dart';
import 'add_meal_app_bar.dart';
import 'add_meal_form.dart';

class AddMealScreenBody extends StatelessWidget {
  const AddMealScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealCubit, MealState>(
      listener: (context, state) {
        if (state is MealLoaded) {
          Navigator.pop(context);
        } else if (state is MealError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message.toString())),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is MealLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            appBar: const AddMealAppBar(title: 'Add Meal'),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AddMealForm(),
              ),
            ),
          ),
        );
      },
    );
  }
}
