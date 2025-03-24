import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/colors.dart';

class TrendingRecipeMostViewedWidget extends StatelessWidget {
  const TrendingRecipeMostViewedWidget({
    super.key,
    required this.photo,
    required this.title,
    required this.desc,
    required this.timeRequired, required this.rating,
  });

  final String desc, photo, title;
  final num timeRequired, rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 241.h,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Most viewed Today",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 348.w,
                    height: 49.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: AppColors.beigeColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/clock.svg"),
                                  Text(
                                    "$timeRequired min",
                                    style: TextStyle(
                                      color: AppColors.pinkSub,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 300,
                                child: Text(
                                  desc,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors.beigeColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${rating}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      color: AppColors.pinkSub,
                                    ),
                                  ),
                                  SvgPicture.asset("assets/icons/star.svg"),
                                ],
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
                    photo,
                    width: 358.w,
                    height: 143.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

