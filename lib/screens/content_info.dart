import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ContentInfo extends StatefulWidget {

  const ContentInfo({Key? key})
      : super(key: key);

  @override
  State<ContentInfo> createState() => _ContentInfoState();
}

class _ContentInfoState extends State<ContentInfo> {
  late List<String> featuredTags = [];
  late Content content;
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    content = Provider.of<HomeScreenNavState>(context,listen: false).content;

    // Sorting the tags based on tagValue, to get important tags
    // Then that is displayed in the information for that content

    content.tags?.sort((tag1, tag2) => (tag1.tagValue < tag2.tagValue) ? 1 : 0);
    for (int i = 0; i < 3; i++) {
      featuredTags.add(content.tags!.elementAt(i).tagName);
    }
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
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(alignment: Alignment.center, children: [
              ContentImageAndTitle(
                featuredContent: content,
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
                    buildTagDisplay(featuredTags[1]),
                    const SizedBox(
                      width: 10.0,
                    ),
                    buildTagDisplay(featuredTags[0]),
                    const SizedBox(
                      width: 10.0,
                    ),
                    buildTagDisplay(featuredTags[2]),
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
                    color: content.color,
                  ),
                  onPressed: () {
                    print("Pressed");
                  },
                ),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        content.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                      Row(children: [
                        const Icon(Icons.star, color: Color(0xfffcf800)),
                        const SizedBox(width: 10.0,),
                        Text(
                          content.rating.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )
                      ])
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    content.description!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top : 30.0),
                child: ContentList(
                  key: PageStorageKey(content.name),
              title: 'Similar',
              contentList: originals,
              isOriginals: false,
            ),
              )),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey(content.name),
              title: 'Recommended',
              contentList: trending,
            ),),
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
