import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/heart_item.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_rating.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_time.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

class RecipeSmall extends StatelessWidget {
  const RecipeSmall({super.key, required this.recipeSmallModel});

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
            Positioned(
              bottom: -70.w,
              right: 5,
              left: 5,
              child: Container(
                height: 76.h,
                width: 159.w,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(14)),
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
                    Text(
                      recipeSmallModel.description,
                      style: TextStyle(
                          color: Color(0xff3E2823),
                          fontFamily: "League Spartan",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          height: 1),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecipeRating(
                          rating: recipeSmallModel.rating,
                        ),
                        RecipeTime(time: recipeSmallModel.timeRequired,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  recipeSmallModel.photo,
                  width: 170.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                )),
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
