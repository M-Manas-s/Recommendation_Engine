import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

// Builds the featured area on the home page, with list, play and info buttons

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 500;
    bool shadow = true;
    return Stack(
      alignment: Alignment.center,
      children: [
        ContentImageAndTitle(
          width: MediaQuery.of(context).size.width,
          height: height,
          featuredContent: featuredContent,
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
              _PlayButton(),
              CustomIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () => print("My List")),
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
