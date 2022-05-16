import 'package:flutter/material.dart';
import 'package:recommendation_engine/widgets/widgets.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: const ContentHeader(featuredContent: casinoHeistContent),
            ),
          ),
          SliverToBoxAdapter(
              child: ContentList(
            title: 'My List',
            contentList: myList,
          )),
          SliverToBoxAdapter(
              child: ContentList(
            title: 'Originals',
            contentList: originals,
            isOriginals: true,
          )),
          SliverToBoxAdapter(
              child: ContentList(
            title: 'Trending',
            contentList: trending,
          )),
        ],
      ),
    );
  }
}
