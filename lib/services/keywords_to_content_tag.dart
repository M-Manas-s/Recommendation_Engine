import '../models/models.dart';

// This class filters out keywords from searched String
// and returns it as a List of equal weighed Content Tags

class KeywordsToContentTag {

  String capitalFirst(String s) {
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  List<String> filterKeywords(String s) {

    // Trim the string for whitespace
    s = s.trim();

    // Split individual words
    List<String> list = s.split(' ');

    List<String> newList = [];

    for (int i = 0; i < list.length; i++) {

      // We need to reformat the word in First letter capital format ('Ship')
      list[i] = capitalFirst(list[i]);

      // If the word ends with 's', we add one more word - the same word that doesn't ent with a 's'
      // Example - If the user searches for 'Ships', we need to add 'Ship' to the content tag too
      if (list[i].endsWith('s')) {
        newList.add(list[i].substring(0, list[i].length - 1));
      }
    }
    list.addAll(newList);
    return list;
  }

  List<ContentTag> getContentList(String s) {

    // Gets the list of keywords from the supporting function

    List<String> list = filterKeywords(s);
    List<ContentTag> contentList = [];

    // Then creates the content tag using it and a tag value of 1.
    // Remember that the tag Values are multiplied, so even here if all the tags are
    // ranked with the same value, the content tag with highest value ( Say highest 'Ship' value )
    // will be ranked first

    for (var element in list) {
      contentList.add(ContentTag(tagName: element, tagValue: 1));
    }
    return contentList;
  }
}
