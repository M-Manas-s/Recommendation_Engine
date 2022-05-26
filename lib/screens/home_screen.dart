import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/user_data_state.dart';
import 'package:recommendation_engine/widgets/widgets.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({required Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    trending = allContent;
    trending.sort((a,b) => b.rating.compareTo(a.rating));
    trending.removeRange(20, trending.length);
    originals = allContent.where((element) => ( element.tags.where((e2) => e2.tagName == "Originals").isNotEmpty ) ).toList();
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
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
        key: const PageStorageKey('homeScreen'),
        scrollOffset: _scrollOffset,
      ),
    ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: casinoHeistContent),
          ),
          SliverToBoxAdapter(
              child: ContentList(
            key: const PageStorageKey('homeScreen'),
                scrollController: ScrollController(),
            title: 'Originals',
            contentList: originals,
            isOriginals: true,
          )),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('homeScreen'),
              scrollController: ScrollController(),
              title: 'Trending',
              contentList: trending,
            ),
          ),
          Provider.of<UserDataState>(context).myList.isNotEmpty
              ? SliverToBoxAdapter(
                  child: ContentList(
                  key: const PageStorageKey('homeScreen'),
                  scrollController: ScrollController(),
                  title: 'My List',
                  contentList: Provider.of<UserDataState>(context).myList,
                ))
              : SliverToBoxAdapter(
                  child: Container(),
                ),
        ],
      ),
    );
  }
}
