import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../core/utils/colors.dart';

class RecipeCreateAddVideo extends StatefulWidget {
  const RecipeCreateAddVideo({super.key});

  @override
  _RecipeCreateAddVideoState createState() => _RecipeCreateAddVideoState();
}

class _RecipeCreateAddVideoState extends State<RecipeCreateAddVideo> {
  File? _videoFile;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 281.h,
          decoration: BoxDecoration(
            color: AppColors.pink.withOpacity(0.45),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: 95,
          left: 115,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickVideo,
                child: Container(
                  width: 74.w,
                  height: 71.h,
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain,
                    borderRadius: BorderRadius.circular(37),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/play.svg",
                    ),
                  ),
                ),
              ),
              Text(
                "Add Video recipe",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              if (_videoFile != null)
                Text(
                  "Video selected: ${_videoFile!.path.split('/').last}",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
