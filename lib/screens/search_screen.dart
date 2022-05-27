import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';
import 'package:recommendation_engine/services/services.dart';
import 'package:recommendation_engine/widgets/vertical_content_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const historyLength = 5;
  final List<String> _searchHistory = [];
  late List<String> _filteredSearchHistory;
  final ScrollController scrollController = ScrollController();
  String? selectedTerm;
  bool _searched = false;

  List<String> filterSearchTerms(String? filter) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((element) => element.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    _filteredSearchHistory = filterSearchTerms(null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((element) => element == term);
    _filteredSearchHistory = filterSearchTerms(null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    _filteredSearchHistory = filterSearchTerms(null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if ( controller.isVisible ) {
          controller.close();
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FloatingSearchBar(
              controller: controller,
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: !_searched ? const Center(child: Text("Search something!",style: TextStyle(color: Colors.white,fontSize: 30),))
                : VerticalContentList(scrollController: scrollController,contentList: Provider.of<CurrentContentState>(context).recommended,),
              ),
              transition: CircularFloatingSearchBarTransition(),
              physics: const NeverScrollableScrollPhysics(),
              title: Text(selectedTerm ?? 'Search Movies',
                  style: const TextStyle(color: Colors.black, fontSize: 17)),
              hint: 'Comedy Movies',
              actions: [FloatingSearchBarAction.searchToClear()],
              onQueryChanged: (query) {
                setState(() {
                  _filteredSearchHistory = filterSearchTerms(query);
                });
              },
              onSubmitted: (query) {
                List<ContentTag> searchList = KeywordsToContentTag().getContentList(query);
                Provider
                    .of<CurrentContentState>(context, listen: false)
                    .generatePreferredContent(
                  context: context,
                    recommendedContent: true,
                    contentTagMultiplier: 0.0,
                    limit: 20,
                    userTagPreferences: searchList,
                    userPrefMultiplier: 1.0);
                setState(() {
                  scrollController.animateTo(0.0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                  addSearchTerm(query);
                  selectedTerm = query;
                  _searched = true;
                });
                controller.close();
              },
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                      color: Colors.white,
                      elevation: 4,
                      child: Builder(
                        builder: (context) {
                          if (_filteredSearchHistory.isEmpty &&
                              controller.query.isEmpty) {
                            return Container(
                              height: 56,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                'Start Searching',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            );
                          } else if (_filteredSearchHistory.isEmpty) {
                            return ListTile(
                              title: Text(controller.query),
                              leading: const Icon(Icons.search),
                              onTap: () {

                                setState(() {
                                  addSearchTerm(controller.query);
                                  selectedTerm = controller.query;
                                });
                                controller.close();
                              },
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: _filteredSearchHistory
                                  .map((term) => ListTile(
                                      title: Text(
                                        term,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: const Icon(Icons.history),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            deleteSearchTerm(term);
                                            _filteredSearchHistory = filterSearchTerms(controller.query);
                                          });
                                        },
                                      ),
                                      onTap: () {
                                        List<ContentTag> searchList = KeywordsToContentTag().getContentList(term);
                                        Provider
                                            .of<CurrentContentState>(context, listen: false)
                                            .generatePreferredContent(
                                            context: context,
                                            recommendedContent: true,
                                            contentTagMultiplier: 0.0,
                                            limit: 20,
                                            userTagPreferences: searchList,
                                            userPrefMultiplier: 1.0);
                                        setState(() {
                                          scrollController.animateTo(0.0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                                          putSearchTermFirst(term);
                                          selectedTerm = term;
                                          _searched = true;
                                        });
                                        controller.close();
                                      }))
                                  .toList(),
                            );
                          }
                        },
                      )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
