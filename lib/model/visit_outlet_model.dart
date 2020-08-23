import 'package:sales_track_nex/model/keranjang.dart';

class VisitOutletModel {
  final String barcode,
      latitude,
      longitude,
      namaOutlet,
      nomorPO,
      jenisBayar,
      totalBayar;
  final List<String> foto;
  final List<KeranjangData> keranjangData;

  const VisitOutletModel({
    this.barcode,
    this.latitude,
    this.longitude,
    this.namaOutlet,
    this.nomorPO,
    this.jenisBayar,
    this.totalBayar,
    this.foto,
    this.keranjangData,
  });
}
