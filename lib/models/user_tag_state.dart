import 'package:flutter/material.dart';
import 'package:recommendation_engine/models/content_tag.dart';

class UserTagsPreferenceState with ChangeNotifier {

  List<ContentTag> _userTagPrefs = [
    ContentTag(tagName: "Comedy", tagValue: 5.0),
  ];

  List<ContentTag> get userPrefs => _userTagPrefs;

  void resetData(){
    _userTagPrefs.clear();
    _userTagPrefs.add(ContentTag(tagName: "Empty", tagValue: 1.0));
    notifyListeners();
  }

}