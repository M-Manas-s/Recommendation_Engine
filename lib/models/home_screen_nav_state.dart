import 'package:flutter/material.dart';

class HomeScreenNavState with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if ( _currentIndex!=index || _currentIndex == 3) {
      _currentIndex = index;
    }
    notifyListeners();
  }

}