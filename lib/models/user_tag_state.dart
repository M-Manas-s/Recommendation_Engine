import 'package:flutter/material.dart';
import 'package:recommendation_engine/models/content_tag.dart';

class UserTagsPreferenceState with ChangeNotifier {

  List<ContentTag> _userTagPrefs = [
    ContentTag(tagName: "Comedy", tagValue: 5.0),
    ContentTag(tagName: "Originals", tagValue: 15.0),
    ContentTag(tagName: "Action", tagValue: 2.0),
    ContentTag(tagName: "Crime", tagValue: 4.67),
    ContentTag(tagName: "Guns", tagValue: 2.0),
    ContentTag(tagName: "Parkour", tagValue: 2.0),
    ContentTag(tagName: "Army", tagValue: 4.67),
    ContentTag(tagName: "Historical", tagValue: 2.0),
  ];

  List<ContentTag> get userPrefs => _userTagPrefs;

  void resetData(){
    _userTagPrefs.clear();
    _userTagPrefs.add(ContentTag(tagName: "Empty", tagValue: 1.0));
    notifyListeners();
  }

}