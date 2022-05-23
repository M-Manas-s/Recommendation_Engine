import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/screens/play_movie_screen.dart';
import 'package:recommendation_engine/services/tag_name_hasher.dart';

import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ContentInfo extends StatefulWidget {

  const ContentInfo({Key? key}) : super(key: key);

  @override
  State<ContentInfo> createState() => _ContentInfoState();
}

class _ContentInfoState extends State<ContentInfo> {
  late Content content;
  double _offSet = 0.0;

  @override
  void initState() {
    super.initState();
    TagNameHasher tagNameHasher = TagNameHasher();
    print("Hash : ${tagNameHasher.hashString("abcdasdafgsdafsf")}");

    Provider.of<ScrollControllerState>(context,listen: false).scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _offSet = Provider.of<ScrollControllerState>(context,listen: false).scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    Provider.of<ScrollControllerState>(context,listen: false).scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Provider.of<GlobalNavState>(context).playingVideo ? PlayMovieScreen(content: content) : Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: CustomAppBar(
          scrollOffset: _offSet,
        ),
      ),
      body: CustomScrollView(
        controller: Provider.of<ScrollControllerState>(context).scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(alignment: Alignment.center, children: [
              ContentImageAndTitle(
                featuredContent: Provider.of<CurrentContentState>(context).content,
                onTap: () {},
                width: MediaQuery.of(context).size.width,
                height: 500.0,
                shadow: true,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTagDisplay(Provider.of<CurrentContentState>(context).content.tags[1].tagName),
                    const SizedBox(
                      width: 10.0,
                    ),
                    buildTagDisplay(Provider.of<CurrentContentState>(context).content.tags[0].tagName),
                    const SizedBox(
                      width: 10.0,
                    ),
                    buildTagDisplay(Provider.of<CurrentContentState>(context).content.tags[2].tagName),
                  ],
                ),
              ),

              // Two overlapping icons are required to build
              // a filled play button

              Transform.translate(
                offset: const Offset(0, -20),
                child: IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -20),
                child: IconButton(
                  icon: Icon(
                    Icons.play_circle,
                    size: 60.0,
                    color: Provider.of<CurrentContentState>(context).content.color,
                  ),
                  onPressed: () {
                    content = Provider.of<CurrentContentState>(context,listen: false).content;
                    setState((){
                      Provider.of<GlobalNavState>(context,listen: false).changePlayingVideo(true);
                    });
                  },
                ),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ContentNameRatingDescription(content: Provider.of<CurrentContentState>(context).content,),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: ContentList(
              title: 'Similar',
              contentList: originals,
              isOriginals: false,
            ),
          )),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Recommended',
              contentList: trending,
            ),
          ),
        ],
      ),
    );
  }

  Container buildTagDisplay(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}
