import 'package:calories_tracker/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 8,
      height: 8,
      duration: const Duration(milliseconds: 300),
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: isActive ? AppColors.primaryColor : const Color(0xffCCCCCC)),
    );
  }
}
