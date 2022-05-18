import 'package:flutter/material.dart';
import 'package:recommendation_engine/data/data.dart';

import 'content_model.dart';

class HomeScreenNavState with ChangeNotifier {
  int _currentIndex = 0;
  late Content content = casinoHeistContent;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if ( _currentIndex!=index ) {
      _currentIndex = index;
    }
    notifyListeners();
  }

}