import 'package:calories_tracker/Features/Meal%20DB/Domain/Entity/meal_db_entity.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.meal,
  });

  final MealDBEntity meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              meal.thumbnail,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            meal.name,
            style: Styles.styleBold24(context),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Chip(
                label: Text(meal.category),
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 8),
              Chip(label: Text(meal.area), backgroundColor: Colors.white),
            ],
          ),
          const SizedBox(height: 16),
          Text('Ingredients',
              style: Styles.styleBold19(context).copyWith(color: Colors.black)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              meal.ingredients.length,
              (index) => Chip(
                backgroundColor: Colors.white,
                label: Text(
                  '${meal.ingredients[index]} - ${meal.measures[index]}',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Instructions',
              style: Styles.styleBold19(context).copyWith(color: Colors.black)),
          const SizedBox(height: 8),
          Text(meal.instructions),
        ],
      ),
    );
  }
}
