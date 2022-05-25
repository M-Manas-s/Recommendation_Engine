import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/services/services.dart';

import 'models.dart';

class CurrentContentState with ChangeNotifier {
  late Content content;
  List<Content> recommended = [];
  List<Content> similar = [];

  CurrentContentState() {
    content = casinoHeistContent;
  }

  void generatePreferredContent(
      {required BuildContext context,
      required bool recommendedContent,
      required int limit,
      required double contentTagMultiplier,
      required double userPrefMultiplier,
      required List<ContentTag> userTagPreferences}) async {
    if (recommendedContent) {
      recommended.clear();
    } else {
      similar.clear();
    }

    ContentScorer contentScorer = ContentScorer(
        watched: Provider.of<UserDataState>(context,listen: false).watched,
        focusContent: content,
        contentTagMultiplier: contentTagMultiplier,
        userPrefMultiplier: userPrefMultiplier,
        userTagPreferences: userTagPreferences);


    // Returns the score of each content arranged in the same order as the
    // allContents list

    List<double> contentScores = contentScorer.rankAllContent();

    Map<int, double> contentScoreMap = {};
    for (int i = 0; i < allContent.length; i++) {
      contentScoreMap[i] = contentScores[i];
    }

    // Sort the Map based on the basis on highest score

    Map<int, double> sortedMap = SplayTreeMap<int, double>.from(
        contentScoreMap,
        (key1, key2) =>
            -contentScoreMap[key1]!.compareTo(contentScoreMap[key2]!));

    // Do not filter based on 0 score value if the user has no preferences set

    if ( userTagPreferences.where((element) => element.tagName == "Empty").isEmpty ) {
      sortedMap.removeWhere((key, value) => value == 0.0);
    }

    // Uncomment this to see the recommendations being generated

    // print("${recommendedContent ? "Recommended" : "Similar"}: ");
    // sortedMap.forEach((key, value) => print("Name: ${allContent[key].name}, Score : $value"));

    // Now take top [limit] contents for preferred content

    for (int index in sortedMap.keys) {
      if ( Provider.of<UserDataState>(context,listen: false).watched.contains(allContent[index]) ) {
        continue;
      }
      if (recommendedContent) {
        recommended.add(allContent[index]);
      } else {
        similar.add(allContent[index]);
      }
      limit--;
      if (limit == 0) {
        break;
      }
    }
  }

  void sortTage() {
    // Sorting the tags based on tagValue, to get important tags
    // Then that is displayed in the information for that content

    content.tags.sort((a, b) => (a.tagValue < b.tagValue ? 1 : 0));
  }

  void watchContent(
      {required Content newContent,
      required BuildContext context,
      required int limit}) {

    // User preference gets updated everytime the movie is watched

    if (!Provider.of<UserDataState>(context,listen: false)
        .watched
        .contains(newContent)) {
      Provider.of<UserDataState>(context,listen: false).visited.add(newContent);
    }

    // The recommended section in Movie Watch Screen contains -

    // First 5 most similar Contents
    // Next limit-5 recommended elements\

    // The preference multiplier remains the same

    similar.removeRange(5, limit);

    for ( Content content in recommended ){
      if ( !similar.contains(content) ) {
        similar.add(content);
      }
    }
    recommended = similar;

  }

  void changeContent(
      {required Content newContent,
      required bool generateSimilar,
      required int limit,
      required double contentTagMultiplier,
      required double userPrefMultiplier,
      required List<ContentTag> userTagPreferences,
      required BuildContext context,
      bool movieScreen = false}) {
    content = newContent;
    sortTage();

    // User preferences are considered only while recommending Content

    generatePreferredContent(
        context: context,
        recommendedContent: true,
        limit: limit,
        contentTagMultiplier: contentTagMultiplier,
        userPrefMultiplier: userPrefMultiplier,
        userTagPreferences: userTagPreferences);

    // We will only consider movie tags to find similar content
    // and not consider what user preferences are

    if (generateSimilar) {
      generatePreferredContent(
          context: context,
          recommendedContent: false,
          limit: limit,
          contentTagMultiplier: 1.0,
          userPrefMultiplier: 0.0,
          userTagPreferences: userTagPreferences);
    }

    // User preference only gets updated once when visited
    // Multiple visits won't account for anything

    if (!Provider.of<UserDataState>(context,listen: false)
        .visited
        .contains(newContent)) {
      Provider.of<UserDataState>(context, listen: false)
          .updateTagPreference(newContent.tags, 0.25);
      Provider.of<UserDataState>(context,listen: false).visited.add(newContent);
    }

    // Watching a movie is - Visiting + Watching

    if ( movieScreen ) {
      watchContent(newContent: content,context: context, limit: limit);
    }
    notifyListeners();
  }
}