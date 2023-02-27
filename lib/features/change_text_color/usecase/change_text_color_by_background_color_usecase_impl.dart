import 'package:flutter/material.dart';
import 'package:hey_there/features/change_text_color/usecase/change_text_color_by_background_color_usecase.dart';

class ChangeTextColorByBackgroundColorUsecaseImpl
    implements ChangeTextColorByBackgroundColorUsecase {
  @override
  Color changeTextColorByBackgroundColor(Color colorText, int colorAlpha,
      int colorRed, int colorBlue, int colorGreen) {
    final int averageColorAlpha = 255 ~/ 2;
    final int averageRgb = averageColorAlpha * 3;
    final int averageColors = colorRed + colorBlue + colorGreen;

    if (colorAlpha >= averageColorAlpha) {
      if (averageColors >= averageRgb) {
        return colorText = Colors.black;
      } else {
        if (colorRed + colorBlue >= averageRgb ||
            colorRed + colorGreen >= averageRgb ||
            colorGreen + colorBlue >= averageRgb) {
          return colorText = Colors.black;
        }
        return colorText = Colors.white;
      }
    } else {
      return colorText = Colors.black;
    }
  }
}
