import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Data/models/meal_model.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/custom_add_meal_text_field.dart';
import 'package:kareem_tarek/core/text_styles.dart';
import 'package:kareem_tarek/core/widgets/custom_button.dart';

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
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 16,
          ),
          ImageSelectorWidget(
            image: image,
            onImageSelected: (File? selectedImage) {
              setState(() {
                image = selectedImage;
              });
            },
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
            keyboardType: TextInputType.number,
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
