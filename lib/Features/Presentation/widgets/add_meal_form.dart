import 'dart:io';

import 'package:calories_tracker/Features/Data/models/meal_model.dart';
import 'package:calories_tracker/Features/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:calories_tracker/Features/Presentation/widgets/custom_add_meal_text_field.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:calories_tracker/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'image_selector_widget.dart';
import 'time_picker_widget.dart';

class AddMealForm extends StatefulWidget {
  const AddMealForm({super.key});

  @override
  State<AddMealForm> createState() => _AddMealFormState();
}

class _AddMealFormState extends State<AddMealForm> {
  final fprmKey = GlobalKey<FormState>();
  final TextEditingController _mealNameController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    _timeController.text = DateFormat('hh:mm a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fprmKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSelectorWidget(
            image: image,
            onImageSelected: (image) => setState(() => image = image),
          ),
          const SizedBox(height: 16),
          CustomAddMealTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mealNameController,
            label: 'Meal Name',
            hintText: 'Enter meal name...',
          ),
          const SizedBox(height: 16),
          CustomAddMealTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _caloriesController,
            label: 'Calories',
            hintText: 'Enter calories...',
          ),
          const SizedBox(height: 16),
          TimePickerWidget(controller: _timeController),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Add Meal',
            hasIcon: false,
            style: Styles.styleBold19(context),
            onPressed: () {
              if (fprmKey.currentState!.validate()) {
                final meal = Meal(
                  name: _mealNameController.text,
                  calories: int.tryParse(_caloriesController.text) ?? 0,
                  time: DateFormat('hh:mm a').parse(_timeController.text),
                  imagePath: image?.path,
                );
                context.read<MealCubit>().addMeal(meal);
              }
            },
          ),
        ],
      ),
    );
  }
}
