import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/recipe_small.dart';
import '../../../../core/utils/colors.dart';
import '../manager/category_detail_view_model.dart';
import '../widgets/category_detail_app_bar.dart';


class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({
    super.key,
    required this.viewModel,
    required this.categoryId,
  });

  final CategoryDetailViewModel viewModel;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.beigeColor,
        appBar: CategoryDetailAppBar(
          vm: viewModel,
        ),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: viewModel.recipes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 170 / 226,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return RecipeSmall(
              recipeSmallModel: viewModel.recipes[index],
            );
          },
        ),
      ),
    );
  }
}
