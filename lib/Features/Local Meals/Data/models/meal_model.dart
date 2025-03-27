import 'package:calories_tracker/Features/Local%20Meals/Domain/Entities/meal_entity.dart';
import 'package:hive/hive.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 0)
class Meal extends MealEntity {
  @override
  @HiveField(0)
  final String name;

  @override
  @HiveField(1)
  final int calories;

  @override
  @HiveField(2)
  final DateTime time;

  @override
  @HiveField(3)
  final String? imagePath;

  const Meal({
    required this.name,
    required this.calories,
    required this.time,
    this.imagePath,
  }) : super(name: name, calories: calories, time: time, imagePath: imagePath);

  factory Meal.fromEntity(MealEntity entity) {
    return Meal(
      name: entity.name,
      calories: entity.calories,
      time: entity.time,
      imagePath: entity.imagePath,
    );
  }

  MealEntity toEntity() {
    return MealEntity(
      name: name,
      calories: calories,
      time: time,
      imagePath: imagePath,
    );
  }
}
