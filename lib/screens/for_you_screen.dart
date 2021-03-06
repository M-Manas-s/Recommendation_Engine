import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';
import '../widgets/widgets.dart';

// This is the personal recommendation screen of the application
// This screen takes into account only the personal user preferences while building the recommended list of content

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({Key? key}) : super(key: key);

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: const CustomAppBar(
            key: PageStorageKey('forYou')
        ),
      ),
      body: VerticalContentList(contentList: Provider.of<CurrentContentState>(context).recommended, scrollController: ScrollController(),),
    );
  }
}
