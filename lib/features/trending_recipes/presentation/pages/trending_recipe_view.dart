import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/presentation/widgets/RecipeFlutterAppbar.dart';
import 'package:recipe_app/features/trending_recipes/presentation/pages/trending_recipe_most_viewed_widget.dart';
import 'package:recipe_app/features/trending_recipes/presentation/pages/trending_recipes_widget.dart';
import '../../../../core/presentation/widgets/recipe_app_bar.dart';
import '../../../../core/presentation/widgets/recipe_bottom_bar.dart';
import '../../../../core/utils/colors.dart';
import '../../data/models/trending_recipe_model.dart';
import '../manager/trending_recipe_bloc.dart';
import '../manager/trending_recipe_state.dart';

class TrendingRecipeView extends StatefulWidget {
  const TrendingRecipeView({super.key});

  @override
  _TrendingRecipeViewState createState() => _TrendingRecipeViewState();
}

class _TrendingRecipeViewState extends State<TrendingRecipeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrendingRecipeBloc>(context).add(TrendingRecipeLoading());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBarFlutter(
        title: "Trending Recipes",
        actions: [
          Row(
            spacing: 5,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/notification.svg",
                    colorFilter: ColorFilter.mode(
                        AppColors.pinkSub, BlendMode.srcIn),
                  ),
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/search.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkMain,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<TrendingRecipeBloc, TrendingRecipeState>(
        builder: (context, state) {
          final recipes = state.recipes;
          final TrendingRecipeModel? recipeModel = state.recipesForMostViewed;
          if (state.status == TrendingRecipeStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == TrendingRecipeStatus.error) {
            return Center(child: Text('Error'));
          }
          return ListView(
            padding: EdgeInsets.only(bottom: 100),
            children: [
              TrendingRecipeMostViewedWidget(
                title: recipeModel!.title,
                timeRequired: recipeModel.timeRequired,
                rating: recipeModel.rating,
                desc: recipeModel.description,
                photo: recipeModel.photo,
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 36,
                  children: [
                    for (int i = 0; i < recipes.length; i++)
                      TrendingRecipesWidget(
                        recipeModel: recipes[i],
                        index: i,
                      ),
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
