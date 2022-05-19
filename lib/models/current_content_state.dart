import 'package:flutter/material.dart';
import 'models.dart';

class CurrentContentState with ChangeNotifier{
  late Content content;

  void sortTage(){
    // Sorting the tags based on tagValue, to get important tags
    // Then that is displayed in the information for that content

    content.tags!.sort((a,b) => (a.tagValue < b.tagValue ? 1 : 0));
  }

  void changeContent(Content newContent) {
    content = newContent;
    sortTage();

    notifyListeners();
  }
  
}