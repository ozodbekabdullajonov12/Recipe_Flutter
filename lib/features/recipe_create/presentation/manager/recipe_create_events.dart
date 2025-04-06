part of 'recipe_create_bloc.dart';

sealed class RecipeCreateEvent {}

final class RecipeCreateSubmit extends RecipeCreateEvent {
  final String title;
  final String description;
  final String timeRequired;
  final List<Map<String, TextEditingController>> ingredients;
  final List<TextEditingController> instructions;

  RecipeCreateSubmit({
    required this.title,
    required this.description,
    required this.timeRequired,
    required this.ingredients,
    required this.instructions,
  });
}

final class RecipeCreateAddIngredient extends RecipeCreateEvent {
  final String ingredientName;
  final String ingredientAmount;

  RecipeCreateAddIngredient({
    required this.ingredientName,
    required this.ingredientAmount,
  });
}
