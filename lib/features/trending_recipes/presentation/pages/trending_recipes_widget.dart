import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';
import '../../data/models/trending_recipe_model.dart';

class TrendingRecipesWidget extends StatelessWidget {
  const TrendingRecipesWidget({
    super.key,
    required this.recipeModel,
    required this.index,
  });

  final TrendingRecipeModel? recipeModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (recipeModel == null) {
      return Center(child: Text("No recipes available"));
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 10,
          bottom: 10,
          left: 140,
          child: Container(
            width: 186.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeModel!.title,
                    style: TextStyle(
                      color: AppColors.beigeColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      recipeModel!.description,
                      style: TextStyle(
                        color: AppColors.beigeColor,
                        fontWeight: FontWeight.w300,
                        fontFamily: "League Spartan",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    "By Ozodbek",
                    style: TextStyle(
                      color: AppColors.pinkSub,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/clock.svg"),
                          Text(
                            "${recipeModel!.timeRequired} min",
                            style: TextStyle(
                              color: AppColors.pinkSub,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${recipeModel!.rating}",
                            style: TextStyle(
                              color: AppColors.pinkSub,
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SvgPicture.asset("assets/icons/star.svg"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            recipeModel!.photo,
            width: 151.w,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
