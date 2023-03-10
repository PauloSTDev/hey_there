import 'dart:math';
import 'package:hey_there/src/features/generate_random_number_to_argb/usecase/generate_random_number_to_argb_usecase.dart';

class GenerateRandomNumberUsecaseImpl implements GenerateRandomNumberUsecase {
  @override
  int generateRandomNumberToARGB(maxNumber) {
    if (maxNumber >= 0) {
      return Random().nextInt(maxNumber + 1);
    } else {
      return 0;
    }
  }
}
