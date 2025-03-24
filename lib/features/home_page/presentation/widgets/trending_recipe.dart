import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/widgets/heart_item.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_rating.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_time.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

class TrendingRecipe extends StatelessWidget {
  const TrendingRecipe({super.key, required this.trendingRecipe});

  final RecipeSmallModel trendingRecipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 7,
            right: 7,
            bottom: -45,
            child: Container(
              width: double.infinity,
              height: 49,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                        color: Color(0xffEC888D),
                        width: 1,
                      ),
                      left: BorderSide(
                        color: Color(0xffEC888D),
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Color(0xffEC888D),
                        width: 1,
                      )),
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(14))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          softWrap: true,
                          maxLines: 1,
                          trendingRecipe.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      RecipeTime(time: trendingRecipe.timeRequired)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          softWrap: true,
                          maxLines: 1,
                          trendingRecipe.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "League Spartan",
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      RecipeRating(rating: trendingRecipe.rating),
                    ],
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              trendingRecipe.photo,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 144,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: HeartItem(isLike: false),
          ),

        ],
      ),
    );
  }
}
