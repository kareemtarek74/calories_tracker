part of 'meal_cubit.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object?> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoadingMore extends MealState {}

class MealLoaded extends MealState {
  final List<MealEntity> meals;
  final int totalCalories;

  const MealLoaded(this.meals, this.totalCalories);

  @override
  List<Object?> get props => [meals, totalCalories];
}

class MealError extends MealState {
  final String? message;

  const MealError({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}
