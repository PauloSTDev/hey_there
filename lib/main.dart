import 'package:flutter/material.dart';
import 'package:hey_there/screens/home_page_screen.dart';

void main() {
  runApp(Main());
}

/// Our initialization class
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(title: "Test Task"),
    );
  }
}
