import 'dart:convert';

class RecipeCreateModel {
  final String title;
  final String description;
  final int timeRequired;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final String? videoUrl = null;

  RecipeCreateModel({
    required this.title,
    required this.description,
    required this.timeRequired,
    required this.ingredients,
    required this.instructions,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'time_required': timeRequired,
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'instructions': instructions,
      'video_url': videoUrl,
    };
  }

  // Factory method to create a RecipeCreateModel from JSON
  factory RecipeCreateModel.fromJson(Map<String, dynamic> json) {
    return RecipeCreateModel(
      title: json['title'],
      description: json['description'],
      timeRequired: json['time_required'],
      ingredients: (json['ingredients'] as List)
          .map((ingredient) => Ingredient.fromJson(ingredient))
          .toList(),
      instructions: List<String>.from(json['instructions']),
    );
  }
}

class Ingredient {
  final String amount;
  final String ingredient;

  Ingredient({required this.amount, required this.ingredient});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'ingredient': ingredient,
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      amount: json['amount'],
      ingredient: json['ingredient'],
    );
  }
}
