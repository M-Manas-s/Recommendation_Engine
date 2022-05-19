import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'widgets.dart';

class BuildOptions extends StatelessWidget {

  final Content content;
  final double iconSize;
  final double fontSize;
  const BuildOptions({
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
        PlayButton(playFunction: (){},iconSize: iconSize + 10,fontSize: fontSize,),
        CustomIconButton(
            iconSize: iconSize,
            fontSize: fontSize,
            icon: Icons.info_outline,
            title: 'Info',
            onTap: () async {
              Provider.of<CurrentContentState>(context,listen: false).content = content;
              Provider.of<HomeScreenNavState>(context,listen: false).changeIndex(3);
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
