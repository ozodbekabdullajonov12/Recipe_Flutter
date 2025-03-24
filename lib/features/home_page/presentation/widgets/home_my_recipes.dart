import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/heart_item.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_rating.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_time.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

class HomeMyRecipes extends StatelessWidget {
  const HomeMyRecipes({super.key, required this.recipeSmallModel});

  final RecipeSmallModel recipeSmallModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Routes.recipeBuilder(
          recipeSmallModel.id,
        ));
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  recipeSmallModel.photo,
                  width: 168.w,
                  height: 162.h,
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: -11.w,
              child: Container(
                height: 48.h,
                width: 168.w,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border(
                      bottom: BorderSide(color: AppColors.pinkSub, width: 1),
                      right: BorderSide(color: AppColors.pinkSub, width: 1),
                      left: BorderSide(color: AppColors.pinkSub, width: 1),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeSmallModel.title,
                      style: TextStyle(
                        color: Color(0xff3E2823),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecipeRating(
                          rating: recipeSmallModel.rating,
                        ),
                        RecipeTime(
                          time: recipeSmallModel.timeRequired,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: HeartItem(isLike: false),
            ),
          ],
        ),
      ),
    );
  }
}
