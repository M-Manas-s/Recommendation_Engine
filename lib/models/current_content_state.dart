import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/services/services.dart';

import 'models.dart';

class CurrentContentState with ChangeNotifier {
  late Content content;
  late List<Content> recommended;
  late List<Content> similar;

  void generatePreferredContent(
      bool recommendedContent,
      int limit,
      double contentTagMultiplier,
      double userPrefMultiplier,
      List<ContentTag> userTagPreferences) {
    ContentScorer contentScorer = ContentScorer(
        content: content,
        contentTagMultiplier: contentTagMultiplier,
        userPrefMultiplier: userPrefMultiplier,
        userTagPreferences: userTagPreferences);

    // Returns the score of each content arranged in the same order as the
    // allContents list

    List<double> contentScores = contentScorer.getContentScores();

    Map<int, double> contentScoreMap = {};
    for (int i = 0; i < allContent.length; i++) {
      contentScoreMap[i] = contentScores[i];
    }

    // Sort the Map based on the basis on highest score

    Map<int, double> sortedMap = SplayTreeMap<int, double>.from(
        contentScoreMap,
        (key1, key2) =>
            contentScoreMap[key1]!.compareTo(contentScoreMap[key2]!));

    // Now take top [limit] contents for preferred content
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
    generatePreferredContent(true, limit, contentTagMultiplier,
        userPrefMultiplier, userTagPreferences);
    if (generateSimilar) {
      generatePreferredContent(false, limit, contentTagMultiplier,
          userPrefMultiplier, userTagPreferences);
    }
    notifyListeners();
  }
}