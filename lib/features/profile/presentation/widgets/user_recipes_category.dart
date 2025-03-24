import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRecipesCategory extends StatelessWidget {
  const UserRecipesCategory({
    super.key,
    required this.id,
    required this.image,
    required this.title,
  });

  final int id;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(

        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: -25,
            child: Container(
              width: double.infinity,
              height: 44.h,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  )),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: 103.h,
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

        ],
      ),
    );
  }
}
