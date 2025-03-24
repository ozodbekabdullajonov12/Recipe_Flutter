import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_view_label.dart';


class RecipeViewDetailItem extends StatelessWidget {
  const RecipeViewDetailItem({super.key, required this.dec, required this.time});


  final String dec;
  final num time;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RecipeViewLabel(label: "Details"),
            SizedBox(
              width: 3,
            ),
            SvgPicture.asset(
              "assets/svg/clock.svg",
              width: 10,
              height: 10,
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            Text(
              "${time} min",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Text(
          dec,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          softWrap: true,
          maxLines: 3,
        ),
      ],
    );
  }
}
