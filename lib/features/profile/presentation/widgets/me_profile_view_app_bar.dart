import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/profile/presentation/manager/me_profile_view_model.dart';
import 'package:recipe_app/features/profile/presentation/widgets/me_profile_view_app_bar_bottom.dart';
import 'package:recipe_app/features/profile/presentation/widgets/me_profile_view_app_bar_title.dart';
import 'package:recipe_app/features/profile/presentation/widgets/user_profile_photo.dart';

class MeProfileViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MeProfileViewAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 255.h);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<MeProfileViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.beigeColor,
        leadingWidth: 102.w,
        toolbarHeight: 102.h,
        leading: UserProfilePhoto(photo: viewModel.me.profilePhoto),
        title: MeProfileViewAppBarTitle(),
        actions: [
          Align(
              alignment: Alignment.topCenter,
              child: AppBarAction(child: "assets/svg/plus.svg", onTap: () {})),
          SizedBox(
            width: 4,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: AppBarAction(child: "assets/svg/menu.svg", onTap: () {})),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, double.infinity),
          child: MeProfileViewAppBarBottom(),
        ),
      ),
    );
  }
}
