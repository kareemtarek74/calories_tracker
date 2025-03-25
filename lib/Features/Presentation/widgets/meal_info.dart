import 'package:calories_tracker/Features/Domain/Entities/meal_entity.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealInfo extends StatelessWidget {
  final MealEntity meal;

  const MealInfo({super.key, required this.meal});

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.styleBold16(context),
        ),
        const SizedBox(height: 4),
        Text(
          "${meal.calories} kcal",
          style: Styles.styleRegular14(context).copyWith(
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.clock,
              size: 14,
              color: Colors.grey,
            ),
            const SizedBox(width: 4),
            Text(
              _formatTime(meal.time),
              style:
                  Styles.styleRegular12(context).copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
