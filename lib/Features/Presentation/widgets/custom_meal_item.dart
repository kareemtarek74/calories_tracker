import 'package:calories_tracker/Features/Domain/Entities/meal_entity.dart';
import 'package:calories_tracker/Features/Presentation/widgets/meal_image.dart';
import 'package:calories_tracker/Features/Presentation/widgets/meal_info.dart';
import 'package:flutter/material.dart';

class CustomMealItem extends StatelessWidget {
  final MealEntity meal;
  final VoidCallback onDelete;

  const CustomMealItem({super.key, required this.meal, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealImage(imagePath: meal.imagePath),
          const SizedBox(width: 12),
          Expanded(child: MealInfo(meal: meal)),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
