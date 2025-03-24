import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/utils/colors.dart' show AppColors;

class CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesAppBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 41);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppBar(
        backgroundColor: AppColors.beigeColor,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SizedBox(
            width: 21,
            height: 14,
            child: SvgPicture.asset(
              "assets/svg/back.svg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        leadingWidth: 23,
        title: Text(
          "Categories",
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          AppBarAction(child: "assets/svg/notification.svg", onTap: () {}),
          SizedBox(width: 3,),
          AppBarAction(child: "assets/svg/search.svg", onTap: () {})
        ],
      ),
    );
  }
}
