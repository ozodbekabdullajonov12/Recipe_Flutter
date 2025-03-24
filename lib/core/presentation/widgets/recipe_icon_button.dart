import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    required this.image,
    required this.callback,
    this.size = const Size(28, 28),
  });

  final String image;
  final Size size;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: IconButton(
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
        onPressed: callback,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(image),
      ),
    );
  }
}
