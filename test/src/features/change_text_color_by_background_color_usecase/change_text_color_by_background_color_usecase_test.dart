import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hey_there/src/features/change_text_color/usecase/change_text_color_by_background_color_usecase.dart';
import 'package:hey_there/src/features/change_text_color/usecase/change_text_color_by_background_color_usecase_impl.dart';

void main() {
  ///https://docs.flutter.dev/cookbook/testing/unit/introduction
  ChangeTextColorByBackgroundColorUsecase
      changeTextColorByBackgroundColorUsecase =
      ChangeTextColorByBackgroundColorUsecaseImpl();
  test("Must return black Color", () {
    Color colorText = changeTextColorByBackgroundColorUsecase
        .changeTextColorByBackgroundColor(255, 255, 255, 255);

    expect(Colors.black, colorText);
  });

  test("Must return black Color with colorAlpha < 127", () {
    Color colorText = changeTextColorByBackgroundColorUsecase
        .changeTextColorByBackgroundColor(100, 255, 255, 255);

    expect(Colors.black, colorText);
  });

  test("Must return white Color with colorAlpha >= 127", () {
    Color colorText = changeTextColorByBackgroundColorUsecase
        .changeTextColorByBackgroundColor(127, 130, 130, 0);

    expect(Colors.white, colorText);
  });

  test("Must return black Color with negatives numbers", () {
    Color colorText = changeTextColorByBackgroundColorUsecase
        .changeTextColorByBackgroundColor(-100, -255, -25, -10);

    expect(Colors.black, colorText);
  });

  test(
      "Must return white Color with negatives numbers, colorAlpha >= 127 and rgb = 0",
      () {
    Color colorText = changeTextColorByBackgroundColorUsecase
        .changeTextColorByBackgroundColor(255, -255, -25, -10);

    expect(Colors.white, colorText);
  });
}
