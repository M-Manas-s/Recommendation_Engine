import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black
      ),
      title: 'Flutter Demo',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<GlobalNavState>(
              create: (_) => GlobalNavState()),
          ChangeNotifierProvider<CurrentContentState>(
              create: (_) => CurrentContentState()),
          ChangeNotifierProvider<UserDataState>(
              create: (_) => UserDataState()),
          ChangeNotifierProvider<ScrollControllerState>(
              create: (_) => ScrollControllerState()),
        ],
        child: const BottomNavScreen(),
      ),
    );
  }
}
