import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/models/models.dart';
import 'package:recommendation_engine/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class PlayMovieScreen extends StatefulWidget {
  final Content content;

  const PlayMovieScreen({Key? key, required this.content}) : super(key: key);

  @override
  State<PlayMovieScreen> createState() => _PlayMovieScreenState();
}

class _PlayMovieScreenState extends State<PlayMovieScreen> {
  late VideoPlayerController _videoPlayerController;
  int cycles = 0;
  double finalRating = 0;
  late UserDataState userDataState;
  bool semaphore = true;

  @override
  void initState() {
    super.initState();
    userDataState = Provider.of<UserDataState>(context, listen: false);
    _videoPlayerController = VideoPlayerController.asset(dummyVideoUrl)
      ..initialize().then((_) => setState(() {}));

    if (mounted) {
      _videoPlayerController
        ..addListener(() {
          setState(() {});
          if (_videoPlayerController.value.isInitialized &&
              _videoPlayerController.value.position ==
                  _videoPlayerController.value.duration &&  _videoPlayerController.value.position != Duration.zero &&
          !_videoPlayerController.value.isPlaying) {
            _videoPlayerController.seekTo(Duration.zero);
            if (semaphore) {
              cycles++;
              semaphore = false;
            }
          }
          if ( _videoPlayerController.value.isPlaying ) {
            semaphore = true;
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
    userDataState.updateTagPreference(widget.content.tags, totalCycles);

    // The midway rating ( 5/2 = 2.5 stars ) is considered neutral
    // On moving on the either side of this benchmark, the user tag preferences
    // will be negatively or positively effected

    // 0 stars is a -1 multiplier for the current content tag
    // 5 stars is a +1 multiplier for the current content tag

    // formula goes as => ratingMultiplier = ( finalRating - 2.5 ) / 2.5

    double ratingMultiplier = (finalRating - 2.5) / 2.5;
    userDataState.updateTagPreference(widget.content.tags, ratingMultiplier);

    if (totalCycles >= 1.0) {
      userDataState.watched.add(widget.content);
    }
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rate : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    RatingBar.builder(
                      initialRating: 2.5,
                      minRating: 0,
                      itemSize: 35,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      unratedColor: Colors.grey,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onRatingUpdate: (rating) {
                        finalRating = rating;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                contentList:
                    Provider.of<CurrentContentState>(context, listen: false)
                        .recommended, scrollController: ScrollController(),
                scrollPhysics: const NeverScrollableScrollPhysics(),
              )
            ],
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
