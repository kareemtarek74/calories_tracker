part of 'meal_db_cubit.dart';

abstract class MealDBState extends Equatable {
  const MealDBState();

  @override
  List<Object> get props => [];
}

class MealDBInitial extends MealDBState {}

class MealDBLoading extends MealDBState {}

class MealDBLoadingMore extends MealDBState {}

class MealDBSearchLoaded extends MealDBState {
  final List<MealDBEntity> meals;
  final bool hasMore;

  const MealDBSearchLoaded(this.meals, {this.hasMore = true});

  @override
  List<Object> get props => [meals, hasMore];
}

class MealDBCategoryLoaded extends MealDBState {
  final List<MealDBEntity> meals;
  final String category;
  final bool hasMore;

  const MealDBCategoryLoaded(this.meals, this.category, {this.hasMore = true});

  @override
  List<Object> get props => [meals, category, hasMore];
}

class MealDBDetailsLoaded extends MealDBState {
  final MealDBEntity meal;

  const MealDBDetailsLoaded(this.meal);

  @override
  List<Object> get props => [meal];
}

class MealDBCategoriesLoaded extends MealDBState {
  final List<MealDBCategory> categories;

  const MealDBCategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class MealDBError extends MealDBState {
  final String message;

  const MealDBError({required this.message});

  @override
  List<Object> get props => [message];
}
