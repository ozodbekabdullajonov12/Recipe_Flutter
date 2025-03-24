import 'dart:io';
import 'package:dio/dio.dart';

class CreateReviewModel {
  final int recipeId;
  final int rating;
  final String comment;
  final bool isReco;
  final File? image;

  CreateReviewModel({
    required this.recipeId,
    required this.rating,
    required this.comment,
    required this.isReco,
    this.image,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      "recipeId": recipeId,
      "comment": comment,
      "rating": rating,
      "recommend": isReco,
      "image": image != null
          ? await MultipartFile.fromFile(image!.path,
              filename: image!.path.split("/").last)
          : null
    };
  }
}
