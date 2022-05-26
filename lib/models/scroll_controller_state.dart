import 'package:flutter/material.dart';

class ScrollControllerState with ChangeNotifier{

  ScrollController scrollController = ScrollController();
  ScrollController similarScrollController = ScrollController();
  ScrollController recommendedScrollController = ScrollController();

  void resetScroll()
  {
    if ( scrollController.hasClients ) {
      scrollController.animateTo(0.0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    if ( similarScrollController.hasClients ) {
      similarScrollController.animateTo(0.0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
    }
    if ( recommendedScrollController.hasClients ) {
      recommendedScrollController.animateTo(0.0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
    }
    notifyListeners();
  }

  void hardResetScroll()
  {
    if ( scrollController.hasClients ) {
      scrollController.jumpTo(0.0);
    }
    if ( similarScrollController.hasClients ) {
      similarScrollController.jumpTo(0.0);
    }
    if ( recommendedScrollController.hasClients ) {
      recommendedScrollController.jumpTo(0.0);
    }
    notifyListeners();
  }

  void disposeControllers()
  {
    scrollController.dispose();
    similarScrollController.dispose();
    recommendedScrollController.dispose();
  }

}