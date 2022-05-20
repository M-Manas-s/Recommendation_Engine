import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class VerticalContentList extends StatelessWidget {
  final ScrollPhysics scrollPhysics;
  final List<Content> contentList;
  const VerticalContentList({Key? key, required this.contentList, this.scrollPhysics = const ScrollPhysics()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: scrollPhysics,
        padding: const EdgeInsets.symmetric(
            vertical: 12.0),
        itemCount: contentList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index){
          final Content content = contentList[index];
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: ContentCard(content : content),
          );
        });
  }
}
