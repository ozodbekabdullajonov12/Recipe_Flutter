import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/home_page/data/models/home_chef_model.dart';

class HomeChef extends StatelessWidget {
  const HomeChef({super.key, required this.chef});


  final HomeChefModel chef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Routes.chefProfileBuilder(chef.id));
      },
      child: Column(
        spacing: 3,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
              chef.image,
              fit: BoxFit.cover,
              width: 82,
              height: 74,
            ),
          ),
          Text(
            chef.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
