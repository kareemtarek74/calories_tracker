import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Domain/Entities/meal_entity.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/meal_image.dart';
import 'package:kareem_tarek/core/text_styles.dart';

class CustomMealItem extends StatelessWidget {
  final MealEntity meal;
  final VoidCallback onDelete;

  const CustomMealItem({
    super.key,
    required this.meal,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MealImage(imagePath: meal.imagePath),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name,
                      style: Styles.styleBold16(context).copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${meal.calories} kcal",
                      style: Styles.styleRegular14(context).copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
