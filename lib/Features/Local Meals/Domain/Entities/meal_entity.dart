import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String name;
  final int calories;
  final DateTime time;
  final String? imagePath;

  const MealEntity({
    required this.name,
    required this.calories,
    required this.time,
    this.imagePath,
  });

  MealEntity copyWith({
    String? name,
    int? calories,
    DateTime? time,
    String? imagePath,
  }) {
    return MealEntity(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      time: time ?? this.time,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [name, calories, time, imagePath];
}
