import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';

import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/categories/presentation/manager/categories_cubit.dart';
import 'package:recipe_app/features/categories/presentation/widgets/categories_app_bar.dart';
import 'package:recipe_app/features/categories/presentation/widgets/category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) => RefreshIndicator(
              onRefresh: () async => context.read<CategoriesBloc>().add(
                    CategoriesLoading(),
                  ),
              child: Scaffold(
                backgroundColor: AppColors.beigeColor,
                extendBody: true,
                appBar: CategoriesAppBar(),
                bottomNavigationBar: RecipeBottomNavigationBar(),
                body: state.categories.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child:
                                  CategoryMainItem(model: state.mainCategory!)),
                          SizedBox(
                            height: 3,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemCount: state.categories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) => (!state
                                    .categories[index].main)
                                ? CategoryItem(model: state.categories[index])
                                : null,
                          ),
                        ],
                      ),
              ),
            ));
  }
}
