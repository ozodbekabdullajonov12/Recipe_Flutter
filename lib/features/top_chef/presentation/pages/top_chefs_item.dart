import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

import '../../../../core/utils/colors.dart';
import '../../data/models/top_chef_model.dart';
class TopChefsItem extends StatelessWidget {
  const TopChefsItem({
    super.key,
    required this.chef,
  });

  final TopChefModel chef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.chefProfileBuilder(chef.id)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -66.h,
            left: 0,
            right: 0,
            child: Container(
              width: 170.w,
              height: 76.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chef.firstName,
                      style: TextStyle(
                        color: AppColors.beigeColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      "@${chef.username}",
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          "1234",
                          style: TextStyle(
                            color: AppColors.pinkSub,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/star-filled.svg",
                          colorFilter: ColorFilter.mode(
                            AppColors.pinkSub,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 44.w,
                          height: 13.h,
                          decoration: BoxDecoration(
                            color: AppColors.redPinkMain,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Center(
                            child: Text(
                              "Following",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 13.w,
                          height: 13.h,
                          decoration: BoxDecoration(
                            color: AppColors.redPinkMain,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/share.svg",
                              width: 6.w,
                              height: 8.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              chef.image,
              width: 170.w,
              height: 153.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
