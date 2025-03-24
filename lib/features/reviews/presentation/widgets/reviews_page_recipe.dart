import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/user_small_model.dart';
import 'package:recipe_app/features/reviews/data/models/review_recipe_model.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_page_image.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_recipe_stars.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_recipe_user.dart';

class ReviewsPageRecipe extends StatelessWidget {
  const ReviewsPageRecipe({
    super.key,
    required this.recipe,
  });

  final ReviewsRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 223.h,
      padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.redPinkMain,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewsPageImage(
            image: recipe.image,
          ),
          SizedBox(
            width: 178.w,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  recipe.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                  maxLines: 1,
                ),
                Row(
                  spacing: 4.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReviewsRecipeStars(rating: recipe.rating.toInt()),
                    Text(
                      "(${recipe.reviewsCount} Reviews)",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                  ],
                ),
                ReviewsRecipeUser(user: recipe.user),
                SizedBox(
                  height: 24,
                  width: 126,
                  child: RecipeElevatedButton(
                    text: "Add Review",
                    callback: () {
                      context.push(Routes.createReviewsBuilder(recipe.id));
                    },
                    size: Size(126, 24),
                    foregroundColor: AppColors.redPinkMain,
                    fontSize: 13,
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
