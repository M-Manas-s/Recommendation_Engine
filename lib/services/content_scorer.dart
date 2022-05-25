import 'dart:collection';

import 'package:recommendation_engine/data/data.dart';
import 'package:recommendation_engine/models/models.dart';
import 'package:recommendation_engine/services/services.dart';

class ContentScorer{

  final Content focusContent;
  final double contentTagMultiplier; // Weightage of the Content in ranking
  final double userPrefMultiplier; // Weightage of User Preferences in ranking
  final List<ContentTag> userTagPreferences;
  final List<Content> watched;
  late TagNameHasher _tagNameHasher;
  late Map<int, double> _preferences;

  ContentScorer({
    required this.watched,
    required this.focusContent,
    required this.contentTagMultiplier,
    required this.userPrefMultiplier,
    required this.userTagPreferences,
  }) {
    _tagNameHasher = TagNameHasher();
    _preferences = SplayTreeMap();
    buildPreferencesScore(); // builds the preferences that has to be used for ranking
  }

  void buildPreferencesScore() {
    // Here we are combining the preferences of current point of interest (content) and
    // user's personal preferences

    // For example if contentTagMultiplier = 2.0 and userPrefMultiplier = 1.0,
    // The tags of the Content passed will have twice the weightage than that
    // of user's personal preferences

    // Personal preferences are based on what contents the user has watched
    // They are stored in [user_data_state.dart]

    // This can be useful for searching movies => in this case userPrefMultiplier = 0, or
    // Recommending content while it is the point of interest, where
    // contentTagMultiplier can be greater than 1.0 whereas
    // userPrefMultiplier can be left as 1.0 or 0

    List<ContentTagHashed> hashedUserPrefs;
    List<ContentTagHashed> hashedMoviePrefs;

    if (userPrefMultiplier > 0.0) {
      hashedUserPrefs = _tagNameHasher.hashList(userTagPreferences);
      for (ContentTagHashed hashedContentTags in hashedUserPrefs) {
        _preferences[hashedContentTags.tagNameHash] =
            userPrefMultiplier * hashedContentTags.tagValue;
      }
    }

    if (contentTagMultiplier > 0.0) {
      hashedMoviePrefs = _tagNameHasher.hashList(focusContent.tags);
      for (ContentTagHashed hashedContentTags in hashedMoviePrefs) {
        if (userPrefMultiplier > 0.0 &&
            _preferences.containsKey(hashedContentTags.tagNameHash)) {
          _preferences[hashedContentTags.tagNameHash] =
              _preferences[hashedContentTags.tagNameHash]! +
                  contentTagMultiplier * hashedContentTags.tagValue;
        } else {
          _preferences[hashedContentTags.tagNameHash] =
              hashedContentTags.tagValue;
        }
      }
    }
  }

  List<double> rankAllContent() {
    // This function ranks all the content based on the preferences built
    // and return a list of values with scores of each content arranged
    // in the same order as in the original list

    List<double> allContentScores = List.filled(allContent.length, 0);
    for (int i = 0; i < allContent.length; i++) {
      // i is the index of ith movie (content) in allContent List
      Content content = allContent[i];
        double score = 0.0;
        if (watched.contains(content) || ( contentTagMultiplier > 0.0 && content == focusContent)) {
        // We won't rank watch movies againS
        allContentScores[i] = 0;
        continue;
      }

      // We will extract every tag from content and then hash its name
        // After that if that Tag exists in the preferences that we are
        // matching, we multiply the tag score and add it to the final score

        // For example -  If a user has "comedy" preference of 12.5, and
        // The content has "comedy" preference of 10.0, the score added will
        // be 12.5*10.0 = 125.0

        for ( ContentTag contentTag in content.tags ) {
          int hashedTagName = _tagNameHasher.hashString(contentTag.tagName);
          if ( _preferences.containsKey(hashedTagName) ) {
            score += _preferences[hashedTagName]! * contentTag.tagValue;
          }
        }
        allContentScores[i] = score;
      }
    return allContentScores;
  }

}