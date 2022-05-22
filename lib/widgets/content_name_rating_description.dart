import 'package:flutter/material.dart';

import '../models/models.dart';

class ContentNameRatingDescription extends StatelessWidget {
  final Content content;
  final double titleTextSize;
  final double ratingSize;
  final double descriptionTextSize;

  const ContentNameRatingDescription(
      {Key? key,
      required this.content,
      this.titleTextSize = 25.0,
      this.ratingSize = 18.0,
      this.descriptionTextSize = 15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: titleTextSize),
            ),
            Row(children: [
              const Icon(Icons.star, color: Color(0xfffcf800)),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                content.rating.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: ratingSize),
              )
            ])
          ],
        ),
        const SizedBox(height: 10.0),
        Text(
          content.description,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: descriptionTextSize),
        ),
      ],
    );
  }
}
