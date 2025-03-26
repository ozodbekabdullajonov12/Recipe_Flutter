import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';

class NotificationViewToday extends StatelessWidget {
  const NotificationViewToday({
    super.key, required this.title, required this.subTitle, required this.dateTime,
  });
  final String title, subTitle;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Poppins'),
          ),
          Container(
            width: 355.w,
            height: 75.h,
            padding: EdgeInsets.only(
              top: 15,
              left: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              spacing: 10,
              children: [
                Center(
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.5)),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/star-filled.svg',
                        color: AppColors.redPinkMain,
                        width: 27.w,
                        height: 27.h,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              dateTime.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
