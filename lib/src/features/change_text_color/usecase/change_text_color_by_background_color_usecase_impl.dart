import 'package:flutter/material.dart';
import 'package:hey_there/src/features/change_text_color/usecase/change_text_color_by_background_color_usecase.dart';

class ChangeTextColorByBackgroundColorUsecaseImpl
    implements ChangeTextColorByBackgroundColorUsecase {
  @override
  Color changeTextColorByBackgroundColor(
      int colorAlpha, int colorRed, int colorBlue, int colorGreen) {
    ///Average max of Alpha Color, we will use to know if colorAlpha is above this average
    final int averageMaxColorAlpha = 255 ~/ 2;

    ///Average max of rgb, we will use to compare with summedRGB
    final int averageMaxRgb = (255 * 3) ~/ 2;

    ///Sum of RGB (Ramdomly numbers)
    final int summedRGB = colorRed + colorBlue + colorGreen;

    ///Compare if colorAlpha is above or equal your average max
    if (colorAlpha >= averageMaxColorAlpha) {
      ///Compare if summedColors is above or equal your average max
      if (summedRGB >= averageMaxRgb) {
        return Colors.black;
      } else {
        ///Compare if at least two colors from RGB are above or equal the average max
        if (colorRed + colorBlue >= averageMaxRgb ||
            colorRed + colorGreen >= averageMaxRgb ||
            colorGreen + colorBlue >= averageMaxRgb) {
          return Colors.black;
        }
        return Colors.white;
      }
    } else {
      return Colors.black;
    }
  }
}
