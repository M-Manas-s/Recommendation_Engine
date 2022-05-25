import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/models/models.dart';
import 'package:recommendation_engine/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

import '../models/content_model.dart';

class PlayMovieScreen extends StatefulWidget {
  final Content content;

  const PlayMovieScreen({Key? key, required this.content}) : super(key: key);

  @override
  State<PlayMovieScreen> createState() => _PlayMovieScreenState();
}

class _PlayMovieScreenState extends State<PlayMovieScreen> {
  late VideoPlayerController _videoPlayerController;
  int cycles = 0;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(dummyVideoUrl)
      ..initialize().then((_) => setState(() {}));

    if (mounted) {
      _videoPlayerController
        ..addListener(() {
          setState(() {});
          if (_videoPlayerController.value.isInitialized &&
              _videoPlayerController.value.position ==
                  _videoPlayerController.value.duration) {
            cycles++;
          }
        })
        ..setVolume(0.0)
        ..play();
    }
  }

  @override
  void dispose() {
    double totalCycles = cycles * 1.0 +
        _videoPlayerController.value.position.inMilliseconds /
            _videoPlayerController.value.duration.inMilliseconds;
    Provider.of<UserDataState>(context,listen: false).updateTagPreference(widget.content.tags, totalCycles);
    if ( cycles > 1.0 )
      {
        Provider.of<UserDataState>(context,listen: false).watched.add(widget.content);
      }
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("Huh?");
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_videoPlayerController),
                      _ControlsOverlay(controller: _videoPlayerController),
                      VideoProgressIndicator(_videoPlayerController,
                          allowScrubbing: true),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10.0),
                  child: ContentNameRatingDescription(content: widget.content),
                ),
                const Divider(
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Recommended Movies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                VerticalContentList(
                  contentList: Provider.of<CurrentContentState>(context,listen: false).recommended,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 60.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
