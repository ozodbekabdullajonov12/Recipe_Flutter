import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthSocial extends StatelessWidget {
  const AuthSocial({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: 25,
      height: 25,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    );
  }
}
