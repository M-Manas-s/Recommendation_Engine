import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';
import 'screens.dart';

// This screen is the parent of all the screens on home screen

class HomeTopNavScreen extends StatefulWidget {
  const HomeTopNavScreen({Key? key}) : super(key: key);

  @override
  State<HomeTopNavScreen> createState() => _HomeTopNavScreenState();
}

class _HomeTopNavScreenState extends State<HomeTopNavScreen> {

  late List<Widget> _screens;


  @override
  void initState() {
    _screens = [
      const HomeScreen(key: PageStorageKey('homeScreen'),),
      const ForYouScreen(),
      const MyListScreen(),
      const ContentInfo(key: PageStorageKey('infoScreen'))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:_screens[Provider.of<GlobalNavState>(context).currentHomeScreenIndex],
    );
  }
}
