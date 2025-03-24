import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_app_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/community/data/models/community_recipe_model.dart';
import 'package:recipe_app/features/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_app_bar.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_recipe_widget.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<CommunityViewModel>();
    return Scaffold(
      appBar: CommunityAppBar(
        backTap: () {
          context.pop();
        },
        action1Tap: () {},
        action2Tap: () {},
        action1: "assets/svg/notification.svg",
        action2: "assets/svg/search.svg",
        title: "Community",
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
      extendBody: true,
      body: (!vm.loading)
          ? GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.primaryDelta! > 10) {
                  if (vm.index > 0) vm.index -= 1;
                } else if (details.primaryDelta! < -10) {
                  if (vm.index < 2) vm.index += 1;
                }
              },
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: vm.communityRecipes.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) => Center(
                  child: GestureDetector(
                    onTap: () => context.push(
                      Routes.recipeBuilder(vm.communityRecipes[index].id),
                    ),
                    child: CommunityRecipeWidget(
                      model: vm.communityRecipes[index],
                      created:
                          vm.sinceCreated(model: vm.communityRecipes[index]),
                    ),
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
