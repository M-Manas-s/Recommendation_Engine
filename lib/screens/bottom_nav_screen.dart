import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';
import 'package:recommendation_engine/screens/screens.dart';

// bottom nav screen is the parent of all the screens

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late List<Widget> _screens;

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Profile': Icons.person
  };

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeTopNavScreen(key: PageStorageKey('homeScreen')),
      SearchScreen(),
      ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<GlobalNavState>(context, listen: false).changeHomeScreenIndex(0);
        return false;
      },
      child: Scaffold(
        body: _screens[Provider.of<GlobalNavState>(context).currentParentScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: _icons
              .map((title, icon) => MapEntry(title, BottomNavigationBarItem(
            icon: Icon(icon,size: 30.0),
            label: title
          )))
          .values
          .toList(),
          currentIndex: Provider.of<GlobalNavState>(context).currentParentScreenIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 11.0,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 11.0,
          onTap: (index) => setState(() => Provider.of<GlobalNavState>(context,listen: false).changeParentScreenIndex(index))
        ),
      ),
    );
  }
}
