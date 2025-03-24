import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/colors.dart' show AppColors;
import 'package:recipe_app/features/community/presentation/manager/community_view_model.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({
    super.key,
    required this.tabText,
    required this.index,
  });

  final String tabText;

  final int index;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<CommunityViewModel>();
    return GestureDetector(
      onTap: () {
        vm.index = index;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
        width: 119.w,
        height: 25.h,
        padding: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: (vm.index == index)
                ? AppColors.redPinkMain
                : Colors.transparent),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            tabText,
            style: TextStyle(
              color: (vm.index == index) ? Colors.white : AppColors.redPinkMain,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
