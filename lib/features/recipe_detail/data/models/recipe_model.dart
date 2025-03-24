import 'ingredient_model.dart';
import 'instruction_model.dart';
import 'user_small_model.dart';

class RecipeModel {
  final int id, categoryId, time;
  final num rating;

  final String videoRecipe, title, dec,image;

  final UserSmallModel user;
  final List<IngredientModel> ingredients;

  final List<InstructionModel> instructions;

  RecipeModel({
    required this.id,
    required this.categoryId,
    required this.time,
    required this.rating,
    required this.videoRecipe,
    required this.title,
    required this.image,
    required this.dec,
    required this.user,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json["id"],
      categoryId: json["categoryId"],
      time: json["timeRequired"],
      rating: json["rating"],
      image: json["photo"],
      videoRecipe: json["videoRecipe"],
      title: json["title"],
      dec: json["description"],
      user: UserSmallModel.fromJson(json["user"]),
      ingredients: (json["ingredients"] as List<dynamic>).map((e)=>IngredientModel.fromJson(e)).toList(),
      instructions: (json["instructions"] as List<dynamic>).map((e)=>InstructionModel.fromJson(e)).toList(),
    );
  }
}
