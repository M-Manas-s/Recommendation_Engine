import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/screens/screens.dart';
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

  @override
  void initState() {
    super.initState();
    Provider.of<VideoPlayerState>(context, listen: false)
        .init(context, () => setState((){}), widget.featuredContent);
  }

  @override
  void dispose() {
    Provider.of<VideoPlayerState>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 500;
    bool shadow = true;
    return Stack(
      alignment: Alignment.center,
      children: [
        Provider.of<VideoPlayerState>(context)
                .isPlaying
            ? Stack(
                children: [
                  SizedBox(
                    height: height,
                    child: AspectRatio(
                        aspectRatio: Provider.of<VideoPlayerState>(context,listen: false)
                            .videoPlayerController
                            .value
                            .aspectRatio,
                        child: VideoPlayer(
                            Provider.of<VideoPlayerState>(context, listen: false)
                                .videoPlayerController)),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIconButton(
                  icon: Icons.add,
                  title: 'List',
                  onTap: () => print("My List")),
              const _PlayButton(),
              CustomIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () async {
                    setState(() {
                      Provider.of<VideoPlayerState>(context, listen: false)
                          .offFocus = true;
                      Provider.of<VideoPlayerState>(context,listen: false)
                          .videoPlayerController
                          .pause();
                    });
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContentInfo(content: widget.featuredContent),
                      ),
                    );
                    setState(() {
                      Provider.of<VideoPlayerState>(context, listen: false)
                          .offFocus = false;
                      Provider.of<VideoPlayerState>(context, listen: false)
                          .videoPlayerController
                          .play();
                    });
                  }),
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () => print("Play"),
        icon: const Icon(
          Icons.play_arrow,
          size: 30.0,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(primary: Colors.white),
        label: const Text(
          "Play",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
