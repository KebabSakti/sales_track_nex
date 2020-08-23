import 'package:flutter/material.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sales_track_nex/pages/app.dart';
import 'package:sales_track_nex/pages/camera.dart';
import 'package:sales_track_nex/pages/checkout.dart';
import 'package:sales_track_nex/pages/debug.dart';
import 'package:sales_track_nex/pages/intro.dart';
import 'package:sales_track_nex/pages/login.dart';
import 'package:sales_track_nex/pages/order_product.dart';
import 'package:sales_track_nex/pages/preview_foto.dart';
import 'package:sales_track_nex/pages/tambah_outlet.dart';
import 'package:sales_track_nex/pages/truck.dart';
import 'package:sales_track_nex/pages/visit.dart';
import 'package:sales_track_nex/repository/repository.dart';

class RouteGenerator {
  final Repository repository;
  RouteGenerator(this.repository);

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Intro());
        break;

      case '/login':
        return PageTransition(
            child: Login(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/truck':
        return PageTransition(
            child: Truck(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/app':
        return PageTransition(
            child: App(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/tambah_outlet':
        return PageTransition(
            child: TambahOutlet(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/visit':
        return PageTransition(
            child: Visit(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/order_product':
        return PageTransition(
            child: OrderProduct(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/checkout':
        return PageTransition(
            child: Checkout(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/camera':
        return PageTransition(
            child: Camera(foto: settings.arguments),
            type: PageTransitionType.fade,
            settings: settings);
        break;

      case '/preview_foto':
        return PageTransition(
            child: PreviewFoto(foto: settings.arguments),
            type: PageTransitionType.fade,
            settings: settings);
        break;

      case '/debug':
        return PageTransition(
            child: DebugPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
        break;

      case '/db':
        return MaterialPageRoute(
            builder: (_) => MoorDbViewer(repository.database));
        break;

      default:
        return PageTransition(
            child: Login(),
            type: PageTransitionType.leftToRight,
            settings: settings);
    }
  }

  void dispose() {}
}
