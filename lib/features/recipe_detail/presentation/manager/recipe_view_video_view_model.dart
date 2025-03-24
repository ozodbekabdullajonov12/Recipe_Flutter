import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class RecipeViewVideoViewModel extends ChangeNotifier {
  final String videoUrl, title;

  RecipeViewVideoViewModel({required this.videoUrl, required this.title}) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    controller.initialize().then((value) {
      controller.play();
      notifyListeners();
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }

  @override
  Future<void> dispose() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  late final VideoPlayerController controller;
  late final Timer timer;

  bool _isView = true;
  double volumeValue = 1;

  bool get isView => _isView;

  set isView(bool value) {
    _isView = value;
    notifyListeners();
  }

  changeVolume({required double value}) {
    volumeValue = value;
    print(volumeValue);
    controller.setVolume(value);
    notifyListeners();
  }

  changeSpeed({required double speed}) {
    controller.setPlaybackSpeed(speed);
  }

  changePlaying() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    notifyListeners();
  }

  changePositionTime({required bool isAdd}) {
    if (isAdd) {
      controller.seekTo(controller.value.position + Duration(seconds: 10));
    } else {
      controller.seekTo(controller.value.position - Duration(seconds: 10));
    }
    notifyListeners();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes % 60)}:${twoDigits(duration.inSeconds % 60)}";
  }

  String allVideoTime() {
    return formatDuration(controller.value.duration);
  }

  String nowVideoTime() {
    return formatDuration(controller.value.position);
  }
}
