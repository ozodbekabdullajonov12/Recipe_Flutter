import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews_state.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_page_recipe.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_app_bar.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_page_comment.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReviewsAppBar(
          backTap: () {
            context.pop();
          },
          title: "Reviews"),
      bottomNavigationBar: RecipeBottomNavigationBar(),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          if (state.status == ReviewsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ReviewsStatus.error) {
            return Center(child: Text("Something went wrong"));
          } else if (state.status == ReviewsStatus.idle) {
            return RefreshIndicator(
              onRefresh: () async => context.read<ReviewsBloc>().add(
                    ReviewsLoading(
                      recipeId: state.recipeModel!.id,
                    ),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewsPageRecipe(
                    recipe: state.recipeModel!,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 37.w, vertical: 20.h),
                    child: Text(
                      "Comments",
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 37.w),
                      itemCount: state.comments.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 11),
                      itemBuilder: (context, index) => ReviewsPageComment(
                        comment: state.comments[index],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
