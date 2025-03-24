import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/heart_item.dart';
import 'package:recipe_app/features/community/data/models/community_recipe_model.dart';

class CommunityRecipeImage extends StatelessWidget {
  const CommunityRecipeImage({super.key, required this.model});

  final CommunityRecipeModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: model.image,
            fit: BoxFit.cover,
            height: 173.h,
            width: double.infinity,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                  color: Colors.white,
                ),
              );
            },
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Colors.red),
          ),
        ),
        Positioned(top: 11, right: 13, child: HeartItem(isLike: false))
      ],
    );
  }
}
