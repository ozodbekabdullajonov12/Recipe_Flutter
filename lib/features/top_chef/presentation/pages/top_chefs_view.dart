import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/RecipeFlutterAppbar.dart';
import 'package:recipe_app/features/top_chef/presentation/pages/top_chefs_item.dart';
import '../../../../core/presentation/widgets/recipe_bottom_bar.dart';
import '../../../../core/presentation/widgets/recipe_icon_button_container.dart';
import '../../../../core/utils/colors.dart';
import '../manager/top_chef_bloc.dart';
import '../manager/top_chefs_state.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBarFlutter(
        title: "Top Chef",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/svg/notification.svg",
            iconWidth: 14,
            iconHeight: 19,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/svg/search.svg",
            iconWidth: 12,
            iconHeight: 18,
            callback: () {},
          ),
        ],
      ),
      body: BlocBuilder<TopChefsBloc, TopChefsState>(
        builder: (context, state) => ListView(
          padding: EdgeInsets.only(bottom: 100),
          children: [
            Container(
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Viewed Chefs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var chef in state.mostViewedChefs)
                        TopChefsItem(chef: chef),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Viewed Chefs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 13,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var chef in state.mostLikedChefs)
                        TopChefsItem(chef: chef),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Viewed Chefs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 13,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var chef in state.newChefs)
                        TopChefsItem(chef: chef),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
