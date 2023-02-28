import 'package:flutter_test/flutter_test.dart';
import 'package:hey_there/src/features/generate_random_number_to_argb/usecase/generate_random_number_to_argb_usecase.dart';
import 'package:hey_there/src/features/generate_random_number_to_argb/usecase/generate_random_number_to_argb_usecase_impl.dart';

void main() {
  GenerateRandomNumberUsecase generateRandomNumberUsecase =
      GenerateRandomNumberUsecaseImpl();

  test('Must return true', () {
    int randomNumber =
        generateRandomNumberUsecase.generateRandomNumberToARGB(10);

    expect([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].contains(randomNumber), true);
  });

  test('Must return false', () {
    int randomNumber =
        generateRandomNumberUsecase.generateRandomNumberToARGB(10);

    expect([-1, -2, -3, 11, 12, 13, 14, 15].contains(randomNumber), false);
  });

  test('Must return true because max random number is 1', () {
    int randomNumber =
        generateRandomNumberUsecase.generateRandomNumberToARGB(0);

    expect([0, 1, 2].contains(randomNumber), true);
  });

  test('Must return true because max random number is 2', () {
    int randomNumber =
        generateRandomNumberUsecase.generateRandomNumberToARGB(1);

    expect([0, 1, 2].contains(randomNumber), true);
  });

  test('Must return 0', () {
    int randomNumber =
        generateRandomNumberUsecase.generateRandomNumberToARGB(-10);

    expect(0, randomNumber);
  });
}
