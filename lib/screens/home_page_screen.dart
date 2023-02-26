import 'dart:math';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  static const int rgbMaxNumber = 255;

  Color colorText = Colors.black;
  int colorAlpha = rgbMaxNumber;
  int colorRed = rgbMaxNumber;
  int colorGreen = rgbMaxNumber;
  int colorBlue = rgbMaxNumber;
  double fontSize = 25.0;

  int generateRandomNumber() {
    return Random().nextInt(rgbMaxNumber);
  }

  void updateColor() {
    setState(() {
      colorAlpha = generateRandomNumber();
      colorRed = generateRandomNumber();
      colorBlue = generateRandomNumber();
      colorGreen = generateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => updateColor(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Test Task"),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromARGB(colorAlpha, colorRed, colorGreen, colorBlue),
          ),
          child: Center(
            child: Text(
              'Hey there',
              style: TextStyle(fontSize: fontSize, color: colorText),
            ),
          ),
        ),
      ),
    );
  }
}
