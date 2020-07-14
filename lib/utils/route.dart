import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sales_track_nex/pages/app.dart';
import 'package:sales_track_nex/pages/debug.dart';
import 'package:sales_track_nex/pages/intro.dart';
import 'package:sales_track_nex/pages/login.dart';
import 'package:sales_track_nex/pages/sync.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Intro());
        break;

      case '/login':
        return PageTransition(
            child: Login(), type: PageTransitionType.fade, settings: settings);
        break;

      case '/sync':
        return PageTransition(
            child: SyncPage(), type: PageTransitionType.fade, settings: settings);
        break;

      case '/app':
        return PageTransition(
            child: App(), type: PageTransitionType.fade, settings: settings);
        break;

      case '/debug':
        return PageTransition(
            child: DebugPage(),
            type: PageTransitionType.fade,
            settings: settings);
        break;

      default:
        return PageTransition(
            child: Login(), type: PageTransitionType.fade, settings: settings);
    }
  }
}
