import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_icon.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/categories/presentation/manager/categories_cubit.dart';
import 'package:recipe_app/features/categories/presentation/pages/categories_view.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withValues(alpha: 0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          // bottom: 40.h,
          // right: 0,
          // left: 0,
          child: BottomNavigationBarVanilla(),
        ),
      ],
    );
  }
}

class BottomNavigationBarVanilla extends StatelessWidget {
  const BottomNavigationBarVanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RecipeBottomIcon(
              onTap: () {
                context.go(Routes.homePage);
              },
              icon: "assets/svg/bottom/home.svg"),
          RecipeBottomIcon(
              onTap: () {
                context.push(Routes.community);
              },
              icon: "assets/svg/bottom/community.svg"),
          RecipeBottomIcon(
              onTap: () {
                context.push(Routes.categories);
              },
              icon: "assets/svg/bottom/categories.svg"),
          RecipeBottomIcon(
              onTap: () {
                context.push(Routes.meProfile);
              },
              icon: "assets/svg/bottom/profile.svg")
        ],
      ),
    );
  }
}
