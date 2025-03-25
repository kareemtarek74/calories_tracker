import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimePickerWidget extends StatelessWidget {
  final TextEditingController controller;

  const TimePickerWidget({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Choose meal time...',
        labelStyle: const TextStyle(color: Color(0xff7F7F7F)),
        hintText: controller.text,
        hintStyle: const TextStyle(color: Color(0xff7F7F7F)),
        suffixIcon: IconButton(
          icon: const Icon(FontAwesomeIcons.clock,
              color: Color(0xff5F33E1), size: 20),
          onPressed: () => pickTime(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Color(0xFFBABABA)),
        ),
      ),
    );
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onSurface: Colors.black,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      controller.text = pickedTime.format(context);
    }
  }
}
