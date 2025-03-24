import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/categories/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.go(Routes.categoryDetailBuilder(model.id));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              model.image,
              width: 158.w,
              height: 144.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6,),
          Text(
            model.title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}




class CategoryMainItem extends StatelessWidget {
  const CategoryMainItem({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.go(Routes.categoryDetailBuilder(model.id));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            softWrap: true,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              model.image,
              width: double.infinity,
              height: 149.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6,),

        ],
      ),
    );
  }
}
