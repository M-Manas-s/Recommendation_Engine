import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

// Builds the horizontal scrollable content area

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;
  final ScrollController scrollController;

  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    this.isOriginals = false,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: isOriginals ? 500.0 : 220.0,
            child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                itemCount: contentList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        right: index != contentList.length ? 10.0 : 0.0),
                    child: ContentImageAndTitle(
                      height: isOriginals ? 400.0 : 200.0,
                      width: isOriginals ? 230.0 : 130.0,
                      featuredContent: content,
                      shadow: false,
                      onTap: () {
                        Provider.of<CurrentContentState>(context, listen: false)
                            .changeContent(
                                newContent: contentList[index],
                                contentTagMultiplier: 2.0,
                                generateSimilar: true,
                                limit: 5,
                                userTagPreferences:
                                    Provider.of<UserDataState>(
                                            context,
                                            listen: false)
                                        .userPrefs,
                                userPrefMultiplier: 1.0,
                                context: context);
                        Provider.of<GlobalNavState>(context, listen: false)
                            .changeHomeScreenIndex(3);
                        Provider.of<ScrollControllerState>(context,
                                listen: false)
                            .resetScroll();
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
