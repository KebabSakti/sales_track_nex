import 'package:flutter/material.dart';

class JadwalItemModel {
  final String outletId, outletName, lastVisit;
  final int visitStatus;

  JadwalItemModel({
    @required this.outletId,
    @required this.outletName,
    @required this.lastVisit,
    @required this.visitStatus,
  });

  JadwalItemModel copyWith(
          {String outletId,
          String outletName,
          String lastVisit,
          int visitStatus}) =>
      JadwalItemModel(
        outletId: outletId ?? this.outletId,
        outletName: outletName ?? this.outletName,
        lastVisit: lastVisit ?? this.lastVisit,
        visitStatus: visitStatus ?? this.visitStatus,
      );
}
