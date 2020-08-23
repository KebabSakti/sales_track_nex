import 'package:flutter/cupertino.dart';
import 'package:sales_track_nex/model/keranjang.dart';

class VisitPageModel {
  VisitPageModel(
      {@required this.barcode,
      @required this.lat,
      @required this.lng,
      @required this.namaOutlet,
      this.fotoVisit,
      this.keranjangData});

  String barcode;
  String lat;
  String lng;
  String namaOutlet;
  List<String> fotoVisit;
  List<KeranjangData> keranjangData;
}
