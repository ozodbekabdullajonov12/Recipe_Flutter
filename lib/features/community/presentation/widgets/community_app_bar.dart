import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/utils/colors.dart' show AppColors;
import 'package:recipe_app/features/community/presentation/widgets/community_tab.dart';

class CommunityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBar({
    super.key,
    required this.backTap,
    required this.action1Tap,
    required this.action2Tap,
    required this.action1,
    required this.action2,
    required this.title,
  });

  final VoidCallback backTap, action1Tap, action2Tap;
  final String action1, action2, title;

  @override
  Size get preferredSize => Size(double.infinity, 100.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.beigeColor,
        toolbarHeight: 61,
        leading: IconButton(
          onPressed: backTap,
          iconSize: 10,
          icon: SizedBox(
            width: 33,
            height: 14,
            child: SvgPicture.asset(
              "assets/svg/back.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        leadingWidth: 37,
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
        actions: [
          AppBarAction(child: action1, onTap: action1Tap),
          SizedBox(
            width: 4,
          ),
          AppBarAction(child: action2, onTap: action2Tap)
        ],
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommunityTab(
                  tabText: "Top Recipes",
                  index: 0,
                ),
                CommunityTab(
                  tabText: "Newest",
                  index: 1,
                ),
                CommunityTab(
                  tabText: "Oldest",
                  index: 2,
                ),
              ],
            )),
      ),
    );
  }
}
