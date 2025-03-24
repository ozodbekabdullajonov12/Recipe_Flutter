import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/app_bar_action.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../categories/data/models/category_model.dart';
import '../manager/category_detail_view_model.dart';





class CategoryDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryDetailAppBar({super.key, required this.vm});

  final CategoryDetailViewModel vm;

  @override
  Size get preferredSize => Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    vm.load();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: AppColors.beigeColor,
        leading: GestureDetector(
          onTap: () {
            context.go(Routes.categories);
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
          vm.selected!.title,
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
          SizedBox(
            width: 3,
          ),
          AppBarAction(child: "assets/svg/search.svg", onTap: () {})
        ],
        bottom: CategoryDetailAppBarBottom(
          categories: vm.categories,
          selected: vm.selected!,
        ),
      ),
    );
  }
}

class CategoryDetailAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryDetailAppBarBottom(
      {super.key, required this.categories, required this.selected});

  final List<CategoryModel> categories;
  final CategoryModel selected;

  @override
  Size get preferredSize => Size(double.infinity, 25);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            context.go(Routes.categoryDetailBuilder(categories[index].id));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 9),
            height: 25,
            decoration: BoxDecoration(
              color: (selected!=categories[index])?Colors.transparent:AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Center(
              child: Text(
                categories[index].title,
                style: TextStyle(
                  color: (selected==categories[index])?Colors.white:AppColors.redPinkMain,
                  fontFamily: "League Spartan",
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
