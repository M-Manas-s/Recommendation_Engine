import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class HorizontalContentList extends StatelessWidget {
  final List<Content> contentList;
  const HorizontalContentList({Key? key, required this.contentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(
            vertical: 12.0),
        itemCount: contentList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context,int index){
          final Content content = contentList[index];
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: ContentCard(content : content),
          );
        });
  }
}
