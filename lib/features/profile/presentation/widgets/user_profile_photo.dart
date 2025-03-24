import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/profile/presentation/manager/me_profile_view_model.dart';

class UserProfilePhoto extends StatelessWidget {
  const UserProfilePhoto({
    super.key, required this.photo,
  });

  final String photo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        photo,
        width: 100.w,
        height: 100.h,
      ),
    );
  }
}
