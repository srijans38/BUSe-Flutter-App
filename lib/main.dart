import 'package:buse_test/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.orangeAccent,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black.withOpacity(0.6),
        accentColor: Colors.orangeAccent,
        cardColor: Color(0xffe67e22),
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

ThemeData MyThemeLight = ThemeData.light().copyWith();
