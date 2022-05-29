import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/services/services.dart';
import 'models.dart';

// Extends splash tree as a multimap by linking same values together

extension SplayTreeMultiMapExtension<K, V> on SplayTreeMap<K, List<V>> {
  void add(K key, V value) {
    (this[key] ??= []).add(value);
  }
}

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

    // A SplayTreeMap is used to store the keys in sorted order
    // Here, we reverse the keys and values => We store the score as key
    // and value will be the index

    // Since SplayTreeMap cannot handle duplicate values, which we may get because
    // multiple content can have the same score, we store values as a list

    SplayTreeMap<double, List<int>> contentScoreMap = SplayTreeMap();
    for (int i = 0; i < allContent.length; i++) {
      contentScoreMap.add(contentScores[i], i);
    }

    for (List<int> list in contentScoreMap.values.toList().reversed) {
      for (int index in list) {
        if ( contentScores[index] == 0.0 ) {
          continue;
        }
        if (Provider.of<UserDataState>(context, listen: false)
            .watched
            .contains(allContent[index])) {
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