import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_rating.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_time.dart';
import 'package:recipe_app/features/community/data/models/community_recipe_model.dart';

class CommunityRecipeDetails extends StatelessWidget {
  const CommunityRecipeDetails({
    super.key,
    required this.model,
  });

  final CommunityRecipeModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "${model.title}",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 1,
              ),
              RecipeRating(
                rating: model.rating,
                color: Colors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 289.w,
                child: Text(
                  "${model.dec}",
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "League Spartan",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RecipeTime(
                    time: model.time,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/reviews.svg",
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "${model.reviewsCount}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
