import 'package:flutter/cupertino.dart';

class MessageModel {
  final String judul, deskripsi, createdAt;
  final int isRead;

  MessageModel({
    @required this.judul,
    @required this.deskripsi,
    @required this.createdAt,
    @required this.isRead,
  });

  MessageModel copyWith(
          {String judul, String deskripsi, String createdAt, int isRead}) =>
      MessageModel(
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        createdAt: createdAt ?? this.createdAt,
        isRead: isRead ?? this.isRead,
      );
}
