import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';
import '../assets.dart';

// Build the top app bar

class CustomAppBar extends StatelessWidget {

  final double scrollOffset;

  const CustomAppBar({required Key key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 24.0,
      ),

      // Clamp the opacity between 0 and 1
      // based on the scrolling pixels
      // That means - scrolling 350 pixels will render the Opacity as 1

      key: key,
      color: Colors.black.withOpacity((scrollOffset/350).clamp(0,1).toDouble()),

      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(padding: const EdgeInsets.all(8),
            child: Image.asset(Assets.appIcon)),
            _AppBarButton(title: "Movies", onTap: () => Provider.of<GlobalNavState>(context,listen: false).changeHomeScreenIndex(0)),
            _AppBarButton(title: "For You", onTap: () {
              Provider
                  .of<CurrentContentState>(context, listen: false)
                  .generatePreferredContent(
                  context: context,
                        recommendedContent: true,
                        contentTagMultiplier: 0.0,
                        limit: 20,
                        userTagPreferences:
                            Provider.of<UserDataState>(context,
                                    listen: false)
                                .userPrefs,
                        userPrefMultiplier: 1.0);
              Provider.of<GlobalNavState>(context,listen: false).changeHomeScreenIndex(1);
            },),
            _AppBarButton(title: "My List", onTap: () => Provider.of<GlobalNavState>(context,listen: false).changeHomeScreenIndex(2)),
          ],
        ),
      ),
    );
  }
}

// Modular AppBar Buttons

class _AppBarButton extends StatelessWidget {

  final String title;
  final Function onTap;

  const _AppBarButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: const TextStyle(
              color :  Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}

