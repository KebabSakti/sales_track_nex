import 'package:flutter/cupertino.dart';

class TambahOutletPageModel {
  const TambahOutletPageModel({
    @required this.barcode,
    @required this.latitude,
    @required this.longitude,
    @required this.namaOutlet,
    @required this.owner,
    @required this.telp,
    @required this.alamat,
  });

  final String barcode, latitude, longitude, namaOutlet, owner, telp, alamat;
}
