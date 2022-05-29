import 'package:flutter/material.dart';
import 'package:recommendation_engine/widgets/widgets.dart';
import '../models/content_model.dart';

class ContentCard extends StatelessWidget {
  final Content content;

  const ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: const Color(0xff101010),
      child: IntrinsicHeight(
        child: Row(children: [
          SizedBox(
            width: size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(content.imageUrl), fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(12.0),
                    child: ContentNameRatingDescription(
                      content: content,
                      titleTextSize: 16,
                      descriptionTextSize: 12,
                      ratingSize: 15,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContentBuildOptions(
                      content: content, iconSize: 15, fontSize: 13),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
