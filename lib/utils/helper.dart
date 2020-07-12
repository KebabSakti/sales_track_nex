import 'dart:math';

class Helper {
  String generateRandomNumber() {
    int min = 100000000;
    int max = 999999999;
    final _random = new Random();
    var value = min + _random.nextInt(max - min);

    return value.toString();
  }
}
