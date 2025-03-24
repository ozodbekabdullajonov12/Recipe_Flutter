import 'dart:core';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/core/Exceptions/auth_exception.dart';
import 'package:recipe_app/core/interceptor.dart';
import 'package:recipe_app/core/secure_storage.dart';
import 'package:recipe_app/features/auth/data/models/sign_up_user_model.dart';
import 'package:recipe_app/features/reviews/data/models/create_review_model.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "http://192.168.0.106:8888/api/v1", validateStatus: (value)=>true));
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<String> login(
      {required String login, required String password}) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data["accessToken"]!.toString();
    } else {
      throw AuthException();
    }
  }

  Future<Map<String, dynamic>> signUp({required SignUpUserModel user}) async {
    var responce = await dio.post("/auth/register", data: user.toJson());
    if (responce.statusCode == 201) {
      String token = responce.data["accessToken"];
      return {
        "result": true,
        "token": token,
      };
    } else {
      return {
        "result": true,
        "token": null,
      };
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get('/onboarding/list');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> fetchChefProfileById(int userId) async {
    var responce = await dio.get("/auth/details/$userId");
    Map<String, dynamic> data = responce.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipesByUserId(int userId) async {
    var response = await dio.get("/recipes/list?UserId=$userId");
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchMyProfile() async {
    var response = await dio.get("/auth/me");
    return response.data;
  }

  Future<List<dynamic>> fetchMyRecipes([int? limit]) async {
    var response = await dio.get("/recipes/my-recipes?Limit=${limit ?? ""}");
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchHomeChefs([int? limit]) async {
    var response = await dio.get("/auth/top-chefs?Limit=${limit ?? ""}");
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipesOrderByDate(int? limit) async {
    var response = await dio
        .get("/recipes/list?Limit=${limit ?? ""}&Order=date&Descending=false");
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get("/categories/list");
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get("/recipes/detail/$recipeId");
    return response.data;
  }

  Future<dynamic> fetchTrendingRecipe() async {
    var response = await dio.get("/recipes/trending-recipe");
    return response.data;
  }

  Future<List<dynamic>> fetchRecipesByCategoryId(int categoryId) async {
    var response = await dio.get("/recipes/list?Category=$categoryId");
    final List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchCommunityRecipes(
    int? limit, {
    required String order,
    bool descending = true,
  }) async {
    var response = await dio.get(
        "/recipes/community/list?Limit=${limit ?? ""}&Order=$order&Descending=$descending");
    List<dynamic> data = response.data;
    return data;
  }

  Future<Map<String, dynamic>> fetchRecipeReview(int recipeId) async {
    var responce = await dio.get("/recipes/reviews/detail/$recipeId");
    Map<String, dynamic> data = responce.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipeComments(int recipeId) async {
    var response = await dio.get("/reviews/list?recipeId=$recipeId");
    List<dynamic> data = response.data;
    return data;
  }

  Future<bool> createReview({required CreateReviewModel review}) async {
    final FormData formData = FormData.fromMap(await review.toJson());
    var response = await dio.post("/reviews/create", data: formData);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> fetchRecipeForReviews(int recipeId) async {
    var response = await dio.get('/recipes/create-review/$recipeId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return throw Exception(
          "recipes/reviews/detail/$recipeId so'rovimiz xato ketti!");
    }
  }

  Future<T> genericGetRequest<T>(String path,
      {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(
          requestOptions: response.requestOptions, response: response);
    }
  }
}
