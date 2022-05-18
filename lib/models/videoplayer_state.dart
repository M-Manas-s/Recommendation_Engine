import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'content_model.dart';

class VideoPlayerState with ChangeNotifier{
  late VideoPlayerController videoPlayerController;
  bool _isScrolling = false;
  bool offFocus = false;

  bool get isScrolling => _isScrolling;

  void init(BuildContext context, Function rebuildChildState, Content featuredContent) {
    videoPlayerController =
    VideoPlayerController.asset(featuredContent.videoUrl!)
      ..initialize().then((_) => rebuildChildState())
      ..addListener(() {
        rebuildChildState();
        if ( videoPlayerController.value.position == videoPlayerController.value.duration) {
            videoPlayerController.seekTo(Duration.zero);
            Timer(const Duration(seconds: 5), () {
                if (!offFocus && !_isScrolling) {
                  videoPlayerController.play();
                }
            });
        }
      })
      ..setVolume(0.0)
      ..play();
  }

  bool get isPlaying => videoPlayerController.value.isPlaying;

  void scrolling() {
      if ( videoPlayerController.value.isPlaying ) {
        videoPlayerController.pause();
      }
      _isScrolling = true;
    notifyListeners();
  }

  void stopped() {
    if ( videoPlayerController.value.duration != Duration.zero ) {
      videoPlayerController.play();
    }
      _isScrolling = false;
    notifyListeners();
  }

}