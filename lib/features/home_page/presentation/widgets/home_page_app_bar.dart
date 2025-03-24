import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/home_page/presentation/manager/home_page_view_model.dart';

import '../../../category_detail/presentation/widgets/category_detail_app_bar.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 125);

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomePageViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.beigeColor,
        leadingWidth: 239,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! ${vm.me.name}",
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              maxLines: 1,
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              maxLines: 1,
            )
          ],
        ),
        actions: [
          AppBarAction(child: "assets/svg/notification.svg", onTap: () {}),
          SizedBox(
            width: 4,
          ),
          AppBarAction(child: "assets/svg/search.svg", onTap: () {})
        ],
        bottom: CategoryDetailAppBarBottom(
          categories: vm.categories,
          selected: vm.categories[0],
        ),
      ),
    );
  }
}
