import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recommendation_engine/models/content_tag.dart';
import 'package:recommendation_engine/models/models.dart';
import 'content_model.dart';

class UserDataState with ChangeNotifier {

  final List<Content> watched = [];
  final List<Content> myList = [];
  final List<Content> visited = [];
  final List<ContentTag> _userTagPrefs = [];
  late String country;

  Future<void> getCountryName() async {
    Response data = await http.get(Uri.parse('http://ip-api.com/json'));
    Map resData = jsonDecode(data.body);
    country = resData['country'];
    _userTagPrefs.add(ContentTag(tagName: country, tagValue: 3.0));
  }

  UserDataState() {

    // If the user has no preferences set
    // We need to recommend Content based on some factor
    // Let the prediction be based on user's country

    getCountryName() ;

  }

  List<ContentTag> get userPrefs => _userTagPrefs;

  void resetData() {
    _userTagPrefs.clear();
    watched.clear();
    visited.clear();
    myList.clear();
    _userTagPrefs.add(ContentTag(tagName: country, tagValue: 3.0));
    notifyListeners();
  }

  void updateTagPreference(List<ContentTag> contentTags, double multiplier) {

    // Uncomment this to see where and by what factor the tags are being manipulated

    print("Updating Current Content Tags by a multiplier of $multiplier");

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

    _userTagPrefs.removeWhere((element) => element.tagValue == 0);

  }
}