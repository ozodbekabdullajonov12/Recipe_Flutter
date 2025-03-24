import 'package:flutter/material.dart';
import 'package:recipe_app/features/community/data/models/community_recipe_model.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_recipe_details.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_recipe_image.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_recipe_user.dart';

import '../../../../core/utils/colors.dart';

class CommunityRecipeWidget extends StatelessWidget {
  const CommunityRecipeWidget(
      {super.key, required this.model, required this.created});

  final CommunityRecipeModel model;

  final String created;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CommunityRecipeUser(model: model, created: created),
        Container(
          height: 251,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 4,
            children: [
              CommunityRecipeImage(model: model),
              CommunityRecipeDetails(model: model)
            ],
          ),
        ),
        Divider(
          height: 1,
          color: AppColors.pinkSub,
        )
      ],
    );
  }
}
