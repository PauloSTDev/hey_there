import 'package:flutter/material.dart';
import 'package:hey_there/usecases/generate_random_number.dart';
import 'package:hey_there/usecases/change_text_color_by_background_color.dart';

/// Screen where we will see Randomly Background Color
class HomePageScreen extends StatefulWidget {
  final String title;

  const HomePageScreen({super.key, required this.title});

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

  void updateColor() {
    setState(() {
      colorAlpha = generateRandomNumber(rgbMaxNumber);
      colorRed = generateRandomNumber(rgbMaxNumber);
      colorBlue = generateRandomNumber(rgbMaxNumber);
      colorGreen = generateRandomNumber(rgbMaxNumber);
      colorText = changeTextColorByBackgroundColor(
          colorText, colorAlpha, colorRed, colorBlue, colorGreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () => updateColor(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
            ),
            centerTitle: true,
          ),
          body: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  Color.fromARGB(colorAlpha, colorRed, colorGreen, colorBlue),
            ),
            child: Center(
              child: Text(
                'Hey there',
                style: TextStyle(fontSize: fontSize, color: colorText),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
