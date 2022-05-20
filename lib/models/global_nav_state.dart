import 'package:flutter/material.dart';

class GlobalNavState with ChangeNotifier {
  int _currentHomeScreenIndex = 0;
  int _currentParentScreenIndex = 0;
  bool _playingVideo = false;

  int get currentHomeScreenIndex => _currentHomeScreenIndex;
  int get currentParentScreenIndex => _currentParentScreenIndex;
  bool get playingVideo => _playingVideo;

  void changeHomeScreenIndex(int index) {
    if ( _currentHomeScreenIndex!=index || _currentHomeScreenIndex == 3) {
      _currentHomeScreenIndex = index;
    }
    notifyListeners();
  }

  void changeParentScreenIndex(int index) {
    if ( _currentParentScreenIndex!=index || _currentParentScreenIndex == 3) {
      _currentParentScreenIndex = index;
    }
    notifyListeners();
  }

  void changePlayingVideo(bool value)
  {
    _playingVideo = value;
    notifyListeners();
  }


}