import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_app_bar.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_video_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:video_player/video_player.dart';

class RecipeViewVideo extends StatelessWidget {
  const RecipeViewVideo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeViewVideoViewModel>();
    return Scaffold(
      appBar: (vm.isView)
          ? RecipeAppBar(
              backTap: () {
                Navigator.pop(context);
              },
              action1Tap: () {
                vm.changeSpeed(speed: 2);
              },
              action2Tap: () {
                vm.changeSpeed(speed: 1);
              },
              action1: "assets/svg/share.svg",
              action2: "assets/svg/plus.svg",
              title: vm.title,
            )
          : null,
      body: Center(
        child: AspectRatio(
          aspectRatio: vm.controller.value.aspectRatio,
          child: Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    vm.isView = !vm.isView;
                  },
                  child: VideoPlayer(vm.controller)),
              if (vm.isView)
                Positioned(
                  bottom: 40,
                  left: 10,
                  right: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 15,
                        child: VideoProgressIndicator(
                          vm.controller,
                          allowScrubbing: true,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            vm.nowVideoTime(),
                            style: TextStyle(
                              color: AppColors.redPinkMain,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            vm.allVideoTime(),
                            style: TextStyle(
                              color: AppColors.redPinkMain,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (vm.isView)
                Positioned(
                  right: 20,
                  top: 70,
                  bottom: 70,
                  child: Container(
                    width: 12,
                    // height: 60,
                    padding: EdgeInsets.symmetric( ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: SfSlider.vertical(
                        min: 0.0,
                        max: 1.0,
                        value: vm.volumeValue,
                        interval: 0.1,
                        showTicks: true,
                        // showLabels: true,
                        // enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (value) {
                          vm.changeVolume(value: value);
                        },
                      ),
                    ),
                  ),
                ),
              if (vm.isView)
                Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          vm.changePositionTime(isAdd: true);
                        }, icon: Icon(Icons.add),),
                        GestureDetector(
                          onTap: () {
                            vm.changePlaying();
                          },
                          child: Container(
                            width: 74,
                            height: 74,
                            decoration: BoxDecoration(
                                color: AppColors.redPinkMain,
                                borderRadius: BorderRadius.circular(37)),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/svg/play.svg",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){
                          vm.changePositionTime(isAdd: false);
                        }, icon: Icon(Icons.remove),),
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
