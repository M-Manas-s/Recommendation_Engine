import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recommendation_engine/models/models.dart';

// This state class stores the User Data

class UserDataState with ChangeNotifier {

  final List<Content> watched = [];
  final List<Content> myList = [];
  final List<Content> visited = [];
  final List<ContentTag> _userTagPrefs = [];
  late String country;

  // Gets the country name of the user

  Future<void> getCountryName() async {
    Response data = await http.get(Uri.parse('http://ip-api.com/json'));
    Map resData = jsonDecode(data.body);
    country = resData['country'];
    _userTagPrefs.add(ContentTag(tagName: country, tagValue: 2.0));
  }

  UserDataState() {

    // If the user has no preferences set
    // We need to recommend Content based on some factor
    // Let the prediction be based on user's country

    getCountryName() ;

  }

  List<ContentTag> get userPrefs => _userTagPrefs;

  // Resets all the stored data

  void resetData() {
    _userTagPrefs.clear();
    watched.clear();
    visited.clear();
    myList.clear();
    _userTagPrefs.add(ContentTag(tagName: country, tagValue: 2.0));
    notifyListeners();
  }

  // The user preferences are updated using a variety of point of interests. They are -

  // 1) Clicking on Content Info - Adds one-fourth of the total tags' values of the content to user preferences
  // 2) Listing the Content - Adds one-fourth of the total tags' values of the content to user preferences
  // 3) Watching the Content - Adds ( watch time / total running length of the content ) fraction of the complete tags' values of the content to user preferences
  // 4) Clicking on Content Info - Adds a fraction of tags' values of the content to user preferences as per the following equation - ( finalRating - 2.5 ) / 2.5

  void updateTagPreference(List<ContentTag> contentTags, double multiplier) {

    // Uncomment this to see where and by what factor the tags are being manipulated

    // print("Updating Current Content Tags by a multiplier of $multiplier");

    for (ContentTag contentTag in contentTags) {
      contentTag = ContentTag(
          tagName: contentTag.tagName,
          tagValue: contentTag.tagValue * multiplier);
      if (_userTagPrefs
          .where((element) => element.tagName == contentTag.tagName)
          .isNotEmpty) {
        double val = _userTagPrefs.where((element) => element.tagName == contentTag.tagName).toList()[0].tagValue;
        _userTagPrefs
            .removeWhere((element) => element.tagName == contentTag.tagName);
        contentTag = contentTag.add(val);
        _userTagPrefs.add(contentTag);
      } else {
        _userTagPrefs.add(contentTag);
      }
    }

    // Checking for tags with zero value as negative addition og Content Tag is also possible

    _userTagPrefs.removeWhere((element) => element.tagValue == 0);

  }
}