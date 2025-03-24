import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/recipe_detail/data/models/ingredient_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_view_label.dart';

class RecipeViewIngredients extends StatelessWidget {
  const RecipeViewIngredients({super.key, required this.ingredients});

  final List<IngredientModel> ingredients;


  @override
  Widget build(BuildContext context) {
     List<IngredientModel> sIngredients = List.from(ingredients);
    sIngredients.sort((a, b) => a.order.compareTo(b.order));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeViewLabel(label: "Ingredients"),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: List.generate(
            ingredients.length,
            (index) => RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: "${sIngredients[index].amount??""} ",
                  style: TextStyle(
                    color: AppColors.redPinkMain,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: sIngredients[index].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ]
            )),
          ),
        )
      ],
    );
  }
}
