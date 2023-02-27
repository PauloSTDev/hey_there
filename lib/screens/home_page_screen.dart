import 'dart:math';
import 'package:flutter/material.dart';

/// Screen where we will see Randomly Background Color
class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  static const int rgbMaxNumber = 255;
  static const int averageRgb = 382;
  static const int averageColorAlpha = 123;

  Color colorText = Colors.black;
  int colorAlpha = rgbMaxNumber;
  int colorRed = rgbMaxNumber;
  int colorGreen = rgbMaxNumber;
  int colorBlue = rgbMaxNumber;
  double fontSize = 25.0;

  int generateRandomNumber() {
    return Random().nextInt(rgbMaxNumber);
  }

  void validateTextColor() {
    if (colorAlpha >= averageColorAlpha) {
      colorText = colorRed + colorBlue + colorGreen >= averageRgb
          ? Colors.black
          : Colors.white;
    } else {
      if (colorRed + colorBlue + colorGreen < averageRgb) {
        colorText = Colors.black;
      }
      colorText = Colors.black;
    }
  }

  void updateColor() {
    setState(() {
      colorAlpha = generateRandomNumber();
      colorRed = generateRandomNumber();
      colorBlue = generateRandomNumber();
      colorGreen = generateRandomNumber();
      validateTextColor();
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
