import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'widgets.dart';

// Basically builds the content option - list, play and build
// One of the most influential widget as it is responsible for a lot of
// work inside the app.

class ContentBuildOptions extends StatelessWidget {

  final Content content;
  final double iconSize;
  final double fontSize;

  const ContentBuildOptions({
    Key? key,
    required this.content,
    required this.iconSize,
    required this.fontSize,
  }) : super(key: key);

  void _showBasicsFlash(
    String name,
      BuildContext context,{
    Duration duration = const Duration(seconds: 2),
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(name),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIconButton(
          iconSize: iconSize,
          fontSize: fontSize,
          icon: Icons.add,
          title: 'List',
          onTap: () {

            // Adds the current content to the list if it isn't added already.
            // Shows 'Already Listed' if added

            if ( !Provider.of<UserDataState>(context,listen: false)
                .myList.contains(content) ) {
              Provider.of<UserDataState>(context, listen: false)
                .myList
                .add(content);
              _showBasicsFlash("Listed",context);
              Provider.of<UserDataState>(context, listen: false).updateTagPreference(content.tags,0.25);
            }
            else
              {
                _showBasicsFlash("Already listed",context);
              }
          },
        ),
        PlayButton(
          playFunction: () {

            // Playing the content triggers these actions -

            // 1) Change the content
            // 2) Get recommendations on the new content
            // 3) Switch to the video player screen
            // 4) Switch to the 'Home' screen
            // 5) Switch to the Content Info page ( Movie player is painted over it using the playingVideo boolean )
            // 6) Reset the global scrollControllers scroll position to the top

            Provider.of<CurrentContentState>(context, listen: false)
                .changeContent(
                    context: context,
                    newContent: content,
                    contentTagMultiplier: 2.0,
                    generateSimilar: true,
                    limit: 20,
                    userTagPreferences: Provider.of<UserDataState>(
                            context,
                            listen: false)
                        .userPrefs,
                    userPrefMultiplier: 1.0,
                    movieScreen: true);
            Provider.of<GlobalNavState>(context, listen: false)
                .changePlayingVideo(true);
            Provider.of<GlobalNavState>(context, listen: false)
                .changeParentScreenIndex(0);
            Provider.of<GlobalNavState>(context, listen: false)
                .changeHomeScreenIndex(3);
            Provider.of<ScrollControllerState>(context, listen: false)
                .resetScroll();
          },
          iconSize: iconSize + 10,
          fontSize: fontSize,
        ),
        CustomIconButton(
            iconSize: iconSize,
            fontSize: fontSize,
            icon: Icons.info_outline,
            title: 'Info',
            onTap: () async {

              // Viewing the content triggers these actions -

              // 1) Change the content
              // 2) Get recommendations on the new content
              // 3) Switch to the 'Home' screen
              // 4) Switch to the Content Info page ( Movie player is not painted now as the playingVideo boolean is not set )
              // 5) Reset the global scrollControllers scroll position to the top

              Provider.of<CurrentContentState>(context, listen: false)
                  .changeContent(
                      newContent: content,
                      contentTagMultiplier: 1.0,
                      generateSimilar: true,
                      limit: 20,
                      userTagPreferences: Provider.of<UserDataState>(
                              context,
                              listen: false)
                          .userPrefs,
                      userPrefMultiplier: 1.0,
                      context: context);
              Provider.of<GlobalNavState>(context, listen: false)
                  .changeHomeScreenIndex(3);
              Provider.of<ScrollControllerState>(context, listen: false)
                  .resetScroll();
              Provider.of<GlobalNavState>(context, listen: false)
                  .changePlayingVideo(false);
              Provider.of<GlobalNavState>(context, listen: false)
                  .changeParentScreenIndex(0);
            }),
      ],
    );
  }
}

class PlayButton extends StatelessWidget {

  final Function playFunction;
  final double iconSize;
  final double fontSize;

  const PlayButton({Key? key, required this.playFunction, this.iconSize = 30, this.fontSize = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () => playFunction(),
        icon: Icon(
          Icons.play_arrow,
          size: iconSize,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(primary: Colors.white),
        label: Text(
          "Play",
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
