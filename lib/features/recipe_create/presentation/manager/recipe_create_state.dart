import 'package:equatable/equatable.dart';

class RecipeCreateState extends Equatable {
  const RecipeCreateState({
    required this.ingredientsCount,
    required this.ingredients,
  });

  factory RecipeCreateState.initial() {
    return RecipeCreateState(
      ingredientsCount: 1,
      ingredients: [],
    );
  }

  RecipeCreateState copyWith({
    int? ingredientsCount,
    List<Map<String, String>>? ingredients,
  }) {
    return RecipeCreateState(
      ingredientsCount: ingredientsCount ?? this.ingredientsCount,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  final int ingredientsCount;
  final List<Map<String, String>> ingredients;

  @override
  List<Object?> get props => [ingredientsCount, ingredients];
}
