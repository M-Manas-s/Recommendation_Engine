import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {

  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 24.0,
      ),

      // Clamp the opacity between 0 and 1
      // based on the scrolling pixels
      // That means - scrolling 350 pixels will render the Opacity as 1

      color: Colors.black.withOpacity((scrollOffset/350).clamp(0,1).toDouble()),

      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(Assets.appIcon),
            _AppBarButton(title: "Movies", onTap: () => Provider.of<HomeScreenNavState>(context,listen: false).changeIndex(0)),
            _AppBarButton(title: "For You", onTap: () => print("For You")),
            _AppBarButton(title: "My List", onTap: () => print("My List")),
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
        padding: const EdgeInsets.all(8.0),
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

