import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/services/services.dart';

import 'models.dart';

class CurrentContentState with ChangeNotifier {
  late Content content;
  List<Content> recommended = [];
  List<Content> similar = [];

  CurrentContentState(){
    content = casinoHeistContent;
  }

  void generatePreferredContent(
      {required bool recommendedContent,
      required int limit,
      required double contentTagMultiplier,
      required double userPrefMultiplier,
      required List<ContentTag> userTagPreferences}) {

    if ( recommendedContent ) {
      recommended.clear();
    } else {
      similar.clear();
    }

    ContentScorer contentScorer = ContentScorer(
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

    sortedMap.removeWhere((key, value) => value == 0.0);

    // Now take top [limit] contents for preferred content
    print("${contentScores.length}");
    print("Recommended: ");
    sortedMap.forEach((key, value) => print("Name: ${allContent[key].name}, Score : $value"));

    for (int index in sortedMap.keys) {
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

  void changeContent(
      {required Content newContent,
      required bool generateSimilar,
      required int limit,
      required double contentTagMultiplier,
      required double userPrefMultiplier,
      required List<ContentTag> userTagPreferences}) {

    content = newContent;
    sortTage();

    // User preferences are considered only while recommending Content

    generatePreferredContent(
        recommendedContent: true,
        limit: limit,
        contentTagMultiplier: contentTagMultiplier,
        userPrefMultiplier: userPrefMultiplier,
        userTagPreferences: userTagPreferences);

    // We will only consider movie tags to find similar content
    // and not consider what user preferences are

    if (generateSimilar) {
      generatePreferredContent(
          recommendedContent: false,
          limit: limit,
          contentTagMultiplier: 1.0,
          userPrefMultiplier: 0.0,
          userTagPreferences: userTagPreferences);
    }
    notifyListeners();
  }
}