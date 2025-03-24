import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_view_video.dart';

import '../manager/recipe_view_video_view_model.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeViewModel>();
    return Container(
      width: double.infinity,
      height: 337.h,
      padding: EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  vm.recipe.image,
                  width: double.infinity,
                  height: 281.h,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context,) => ChangeNotifierProvider(
                        create: (context) => RecipeViewVideoViewModel(
                          videoUrl:vm.recipe.videoRecipe,
                          title:vm.recipe.title
                        ),
                        child: RecipeViewVideo(),
                      ),
                    ),
                  ),
                child: Container(
                  width: 74.w,
                  height: 74.h,
                  decoration: BoxDecoration(
                      color: AppColors.redPinkMain,
                      borderRadius: BorderRadius.circular(32)),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/play.svg",
                      fit: BoxFit.cover,
                      width: 30.w,
                      height: 40.h,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 241.w,
                  child: Text(
                    vm.recipe.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/star.svg",
                          width: 10.w,
                          height: 10.h,
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${vm.recipe.rating}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap:   () => context.push(Routes.reviewsBuilder(vm.recipe.id)),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/reviews.svg",
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${vm.recipe.time}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
