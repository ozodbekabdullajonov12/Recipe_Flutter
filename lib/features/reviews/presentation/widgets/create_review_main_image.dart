import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/reviews/data/models/recipe_create_review_model.dart';

class CreateReviewMainImage extends StatelessWidget {
  const CreateReviewMainImage(
      {super.key, required this.recipeModel,});


  final RecipeCreateReviewModel recipeModel;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: recipeModel.image,
              fit: BoxFit.cover,
              height: 206.h,
              width: double.infinity,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: Colors.white,
                  ),
                );
              },
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 37,
              vertical: 10,
            ),
            child: Text(
              recipeModel.title,
              maxLines: 1,
              softWrap: true,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
