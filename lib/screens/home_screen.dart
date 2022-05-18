import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/widgets/widgets.dart';

import '../data/data.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            Provider.of<VideoPlayerState>(context,listen: false).scrolling();
          } else if (scrollNotification is ScrollEndNotification) {
            Provider.of<VideoPlayerState>(context,listen: false).stopped();
          }
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ContentHeader(featuredContent: casinoHeistContent),
            ),
            SliverToBoxAdapter(
                child: ContentList(
              key: const PageStorageKey('homeScreen'),
              title: 'My List',
              contentList: myList,
            )),
            SliverToBoxAdapter(
                child: ContentList(
              key: const PageStorageKey('homeScreen'),
              title: 'Originals',
              contentList: originals,
              isOriginals: true,
            )),
            SliverToBoxAdapter(
              child: ContentList(
                key: const PageStorageKey('homeScreen'),
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
