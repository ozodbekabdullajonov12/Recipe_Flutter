import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/utils/colors.dart' show AppColors;

class   ReviewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReviewsAppBar(
      {super.key,
      required this.backTap,
      required this.title});

  final VoidCallback backTap;
  final String  title;

  @override
  Size get preferredSize => Size(double.infinity, 61.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.w),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.beigeColor,
        toolbarHeight: 61,
        leading: IconButton(
          onPressed: backTap,
          iconSize: 10,
          icon: SizedBox(
            width: 33.w,
            height: 14.h,
            child: SvgPicture.asset(
              "assets/svg/back.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        leadingWidth: 37.w,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
