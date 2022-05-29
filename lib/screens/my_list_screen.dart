import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/user_data_state.dart';
import '../widgets/widgets.dart';

// Shows all the contents that are added to the List

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: const CustomAppBar(key: PageStorageKey('myList')),
        ),
        body: Provider.of<UserDataState>(context, listen: false)
                .myList
                .isNotEmpty
            ? VerticalContentList(
                contentList:
                    Provider.of<UserDataState>(context, listen: false)
                        .myList, scrollController: ScrollController())
            : const Center(
                child: Text(
                "Add something here!",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )));
  }
}
