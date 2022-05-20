import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

// Builds the featured area on the home page, with list, play and info buttons

class ContentHeader extends StatefulWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<ContentHeader> createState() => _ContentHeaderState();
}

class _ContentHeaderState extends State<ContentHeader> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(widget.featuredContent.videoUrl!)
          ..initialize().then((_) => setState(() {}))
          ..addListener(() {
            if (_videoPlayerController.value.isInitialized &&
                _videoPlayerController.value.position ==
                    _videoPlayerController.value.duration &&
                _videoPlayerController.value.duration != Duration.zero) {
              setState(() {
                _videoPlayerController.seekTo(Duration.zero);
                Timer(const Duration(seconds: 5), () {
                  setState(() {
                    _videoPlayerController.play();
                  });
                });
              });
            }
          })
          ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 500;
    bool shadow = true;
    bool offFocus = false;

    return Stack(
      alignment: Alignment.center,
      children: [
        _videoPlayerController.value.isPlaying && !offFocus
            ? Stack(
                children: [
                  SizedBox(
                    height: height,
                    child: AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController)),
                  ),
                  Container(
                    height: height,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center)),
                  )
                ],
              )
            : ContentImageAndTitle(
                width: MediaQuery.of(context).size.width,
                height: height,
                featuredContent: widget.featuredContent,
                shadow: shadow,
                onTap: () {},
              ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: ContentBuildOptions(content: widget.featuredContent, fontSize: 16, iconSize: 25),
        )
      ],
    );
  }
}


