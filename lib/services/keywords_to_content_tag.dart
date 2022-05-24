import '../models/models.dart';

// This class filters out keywords from searched String
// and returns it as a List of equal weighed Content Tags

class KeywordsToContentTag {
  String capitalFirst(String s) {
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  List<String> filterKeywords(String s) {
    s = s.trim();
    List<String> list = s.split(' ');
    List<String> newList = [];
    for (int i = 0; i < list.length; i++) {
      list[i] = capitalFirst(list[i]);
      if (list[i].endsWith('s')) {
        newList.add(list[i].substring(0, list[i].length - 1));
      }
    }
    list.addAll(newList);
    return list;
  }

  List<ContentTag> getContentList(String s) {
    List<String> list = filterKeywords(s);
    List<ContentTag> contentList = [];

    for (var element in list) {
      contentList.add(ContentTag(tagName: element, tagValue: 1));
    }
    return contentList;
  }
}
