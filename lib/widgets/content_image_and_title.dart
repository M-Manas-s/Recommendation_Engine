import 'package:flutter/material.dart';
import '../models/models.dart';

// Builds the content image and content title. Also implements the gesture detector for the content.

class ContentImageAndTitle extends StatelessWidget {
  const ContentImageAndTitle({
    Key? key,
    required double height,
    required double width,
    required Content featuredContent,
    required bool shadow,
    required Function onTap,
  })  : _height = height,
        _width = width,
        _shadow = shadow,
        _featuredContent = featuredContent,
        _onTap = onTap,
        super(key: key);

  final double _height;
  final double _width;
  final Content _featuredContent;
  final bool _shadow;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => _onTap(),
      child: SizedBox(
        height: _height,
        width: _width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: _height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_featuredContent.imageUrl),
                      fit: BoxFit.cover)),
            ),
            _shadow
                ? Container(
                    height: _height,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center)),
                  )
                : Container(),
            Positioned(
              bottom: _shadow ? _height * 0.2 : _height * 0.1,
              child: SizedBox(
                width: _width * 0.8,
                child: Image.asset(_featuredContent.titleImageUrl, fit: BoxFit.fitWidth,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
