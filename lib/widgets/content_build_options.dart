import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'widgets.dart';

class ContentBuildOptions extends StatelessWidget {

  final Content content;
  final double iconSize;
  final double fontSize;
  const ContentBuildOptions({
    Key? key,
    required this.content, required this.iconSize, required this.fontSize,
  }) : super(key: key);


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
          onTap: () => print("My List"),
        ),
        PlayButton(
          playFunction: () {
            Provider.of<CurrentContentState>(context, listen: false)
                .changeContent(
                newContent: content,
                contentTagMultiplier: 2.0,
                generateSimilar: false,
                limit: 5,
                userTagPreferences: Provider.of<UserTagsPreferenceState>(
                    context,
                    listen: false)
                    .userPrefs,
                userPrefMultiplier: 1.0);
            Provider.of<GlobalNavState>(context,listen: false).changePlayingVideo(true);
            Provider.of<GlobalNavState>(context, listen: false).changeParentScreenIndex(0);
            Provider.of<GlobalNavState>(context, listen: false).changeHomeScreenIndex(3);
            Provider.of<ScrollControllerState>(context, listen: false).resetScroll();
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
              Provider.of<CurrentContentState>(context, listen: false)
                  .changeContent(
                      newContent: content,
                      contentTagMultiplier: 2.0,
                      generateSimilar: true,
                      limit: 5,
                      userTagPreferences: Provider.of<UserTagsPreferenceState>(
                              context,
                              listen: false)
                          .userPrefs,
                      userPrefMultiplier: 1.0);
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
