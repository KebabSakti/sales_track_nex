import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class Helper {
  String generateRandomId() {
    int min = 100000000;
    int max = 999999999;
    String dateNow = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    final _random = new Random();
    var value = min + _random.nextInt(max - min);

    return _generateMd5(dateNow + value.toString());
  }

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
