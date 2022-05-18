import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/screens/screens.dart';
import '../models/models.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    ChangeNotifierProvider<VideoPlayerState>(
        create: (_) => VideoPlayerState(),
        child: HomeScreen(key: PageStorageKey('homeScreen'))),
    Scaffold(),
    const Scaffold()
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Profile': Icons.person
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index) => setState(() => _currentIndex = index)
      ),
    );
  }
}
