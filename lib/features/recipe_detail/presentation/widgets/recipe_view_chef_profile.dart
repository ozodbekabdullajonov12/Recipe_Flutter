import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_model.dart';

import '../../../../core/utils/colors.dart';

class RecipeViewChefProfile extends StatelessWidget {
  const RecipeViewChefProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeViewModel>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(31),
          child: Image.network(
            vm.recipe.user.profilePhoto,
            width: 61.w,
            height: 61.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 132.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@${vm.recipe.user.username}",
                style: TextStyle(
                    color: AppColors.redPinkMain,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1),
                maxLines: 1,
                softWrap: true,
              ),
              Text(
                "${vm.recipe.user.name} ${vm.recipe.user.surname}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: "League Spartan",
                ),
                maxLines: 1,
                softWrap: true,
              ),
            ],
          ),
        ),
        Row(
          spacing: 6,
          children: [
            Container(
              width: 109,
              height: 21,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Center(
                child: Text(
                  "Following",
                  style: TextStyle(
                    color: AppColors.redPinkMain,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "League Spartan",
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/svg/three_dots.svg",
              height: 15,
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                AppColors.redPinkMain,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
