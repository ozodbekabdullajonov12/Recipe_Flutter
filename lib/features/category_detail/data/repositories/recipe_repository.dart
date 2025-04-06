import 'package:recipe_app/features/reviews/data/models/recipe_create_review_model.dart';
import 'package:recipe_app/features/reviews/data/models/review_comment_model.dart';
import 'package:recipe_app/features/reviews/data/models/review_recipe_model.dart';

import '../../../../core/client.dart';
import '../../../community/data/models/community_recipe_model.dart';
import '../../../recipe_detail/data/models/recipe_model.dart';
import '../../../trending_recipes/data/models/trending_recipe_model.dart';
import '../models/recipe_small_model.dart';

class RecipeRepository {
  final ApiClient client;

  RecipeModel? recipe;

  ReviewsRecipeModel?   reviewRecipe;

  RecipeRepository({
    required this.client,
  });

  List<RecipeSmallModel> recipesByCategory = [];
  List<RecipeSmallModel> recipesByUser = [];
  List<RecipeSmallModel> myRecipes = [];
  List<RecipeSmallModel> recipesOrderByDate = [];

  List<CommunityRecipeModel> communityRecipes = [];
  


  Future<List<RecipeSmallModel>> fetchRecipesByCategoryId(
      {required int categoryId}) async {
    var recipeData = await client.fetchRecipesByCategoryId(categoryId);
    recipesByCategory =
        recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return recipesByCategory;
  }

  Future<RecipeSmallModel> fetchTrendingRecipe() async {
    var trendingRecipeData = await client.fetchTrendingRecipe();
    var trendingRecipe = RecipeSmallModel.fromJson(trendingRecipeData);
    return trendingRecipe;
  }

  Future<RecipeModel> fetchRecipeById(int recipeId) async {
    var rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeModel.fromJson(rawRecipe);
    return recipe!;
  }

  Future<List<RecipeSmallModel>> fetchRecipesByUserId(
      {required int userId}) async {
    var recipeData = await client.fetchRecipesByUserId(userId);
    recipesByUser =
        recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return recipesByUser;
  }

  Future<List<RecipeSmallModel>> fetchMyRecipes([int? limit]) async {
    var recipeData = await client.fetchMyRecipes(limit);
    myRecipes = recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return myRecipes;
  }

  Future<List<RecipeSmallModel>> fetchRecipesOrderByDate([int? limit]) async {
    var recipeData = await client.fetchRecipesOrderByDate(limit);
    recipesOrderByDate =
        recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return recipesOrderByDate;
  }
  


  Future<List<CommunityRecipeModel>> fetchCommunityRecipes(
    int? limit, {
    required String order,
    bool descending = true,
  }) async {
    var communitiesData = await client.fetchCommunityRecipes(limit,
        order: order, descending: descending);
    communityRecipes = communitiesData.map((e) => CommunityRecipeModel.fromJson(e)).toList();
    return communityRecipes;
  }


  Future<ReviewsRecipeModel> fetchReviewRecipe(int recipeId) async{
    var recipeData=await client.fetchRecipeReview(recipeId);
    reviewRecipe=ReviewsRecipeModel.fromJson(recipeData);
    return reviewRecipe!;
  }

  Future<RecipeCreateReviewModel> fetchRecipeForReviews(int recipeId) async{
    var rawRecipe=await client.fetchRecipeForReviews(recipeId);
    RecipeCreateReviewModel recipeCreate=RecipeCreateReviewModel.fromJson(rawRecipe);
    return recipeCreate;
  }

  Future<List<TrendingRecipeModel>> fetchTrendingRecipes() async {
    var rawRecipe = await client.genericGetRequest<List<dynamic>>('/recipes/trending-recipes');
    List<TrendingRecipeModel> trendingRecipes = rawRecipe
        .map((recipe) => TrendingRecipeModel.fromJson(recipe as Map<String, dynamic>))
        .toList();
    return trendingRecipes;
  }

  Future<TrendingRecipeModel> fetchTrendingRecipeForToday() async {
    var rawRecipe = await client.genericGetRequest<dynamic>('/recipes/trending-recipe');
    return TrendingRecipeModel.fromJson(rawRecipe);
  }
}
