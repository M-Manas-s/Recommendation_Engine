import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

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
        child: const CustomAppBar(),
      ),
      body: HorizontalContentList(contentList: myList),
    );
  }
}
