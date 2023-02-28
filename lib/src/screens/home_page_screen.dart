import 'package:flutter/material.dart';
import 'package:hey_there/src/features/change_text_color/usecase/change_text_color_by_background_color_usecase.dart';
import 'package:hey_there/src/features/change_text_color/usecase/change_text_color_by_background_color_usecase_impl.dart';
import 'package:hey_there/src/features/generate_random_number_to_argb/usecase/generate_random_number_to_argb_usecase.dart';
import 'package:hey_there/src/features/generate_random_number_to_argb/usecase/generate_random_number_to_argb_usecase_impl.dart';

/// Screen where we will see Randomly Background Color
class HomePageScreen extends StatefulWidget {
  final String title;

  const HomePageScreen({
    super.key,
    required this.title,
  });

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final GenerateRandomNumberUsecase generateRandomNumberUsecase =
      GenerateRandomNumberUsecaseImpl();
  final ChangeTextColorByBackgroundColorUsecase
      changeTextColorByBackgroundColorUsecase =
      ChangeTextColorByBackgroundColorUsecaseImpl();

  static const int rgbMaxNumber = 255;

  Color colorText = Colors.black;
  int colorAlpha = rgbMaxNumber;
  int colorRed = rgbMaxNumber;
  int colorGreen = rgbMaxNumber;
  int colorBlue = rgbMaxNumber;
  double fontSize = 25.0;

  void updateColor() {
    setState(() {
      colorAlpha =
          generateRandomNumberUsecase.generateRandomNumberToARGB(rgbMaxNumber);
      colorRed =
          generateRandomNumberUsecase.generateRandomNumberToARGB(rgbMaxNumber);
      colorBlue =
          generateRandomNumberUsecase.generateRandomNumberToARGB(rgbMaxNumber);
      colorGreen =
          generateRandomNumberUsecase.generateRandomNumberToARGB(rgbMaxNumber);
      colorText = changeTextColorByBackgroundColorUsecase
          .changeTextColorByBackgroundColor(
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
