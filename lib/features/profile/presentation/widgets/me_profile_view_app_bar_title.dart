import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/profile/presentation/manager/me_profile_view_model.dart';


class MeProfileViewAppBarTitle extends StatelessWidget {
  const MeProfileViewAppBarTitle({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<MeProfileViewModel>();
    return SizedBox(
      width: 170.w,
      height: 102.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Text(
            softWrap: true,
            maxLines: 1,
            "${viewModel.me.name} ${viewModel.me.surname}",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            softWrap: true,
            maxLines: 1,
            "@${viewModel.me.username}",
            style: TextStyle(
              color: AppColors.pinkSub,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            softWrap: true,
            maxLines: 3,
            viewModel.me.presentation,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "League Spartans",
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
