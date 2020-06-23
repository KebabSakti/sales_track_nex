
import 'package:flutter/material.dart';
import 'package:sales_track_nex/pages/intro.dart';
import 'package:sales_track_nex/pages/login.dart';
import 'package:sales_track_nex/pages/truck.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final param = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Intro());

      case '/trucks':
        return MaterialPageRoute(builder: (_) => Truck());

      default:
        return MaterialPageRoute(builder: (_) => Login());
    }
  }
}
