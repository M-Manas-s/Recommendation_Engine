import 'package:flutter/material.dart';

class ScrollControllerState with ChangeNotifier{

  late ScrollController scrollController;

  void resetScroll()
  {
    scrollController.animateTo(0.0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
    notifyListeners();
  }

  void hardResetScroll()
  {
    scrollController.jumpTo(0.0);
    notifyListeners();
  }

}