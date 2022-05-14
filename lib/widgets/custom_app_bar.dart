import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
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
            _AppBarButton(title: "Movies", onTap: () => print("Tv shows")),
            _AppBarButton(title: "Trailers", onTap: () => print("Trailers")),
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
      onTap: () => onTap,
      child: Text(
        title,
        style: const TextStyle(
            color :  Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

