import 'package:hive/hive.dart';

part 'meal_db_models.g.dart';

@HiveType(typeId: 1)
class MealDBCategory extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String thumbnail;

  @HiveField(2)
  final String description;

  MealDBCategory({
    required this.name,
    required this.thumbnail,
    required this.description,
  });

  factory MealDBCategory.fromJson(Map<String, dynamic> json) {
    return MealDBCategory(
      name: json['strCategory'] ?? '',
      thumbnail: json['strCategoryThumb'] ?? '',
      description: json['strCategoryDescription'] ?? '',
    );
  }
}
