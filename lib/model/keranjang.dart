import 'package:flutter/cupertino.dart';
import 'package:sales_track_nex/database/nex_database.dart';

class KeranjangData {
  final ProdukData produkData;
  final int qty;
  final double total;
  final OrderItemData orderItemData;

  const KeranjangData({
    @required this.produkData,
    @required this.qty,
    this.total,
    this.orderItemData,
  });
}

class KeranjangDetail {
  final Map<String, KeranjangData> keranjangData;
  final double sum;
  String pembayaran = 'Cash';
  final String nomorPo;

  KeranjangDetail({
    @required this.keranjangData,
    this.nomorPo,
    this.sum,
    this.pembayaran,
  });

  KeranjangDetail copyWith({
    Map<String, KeranjangData> keranjangData,
    String nomorPo,
    double sum,
    String pembayaran,
  }) =>
      KeranjangDetail(
        keranjangData: keranjangData ?? this.keranjangData,
        nomorPo: nomorPo ?? this.nomorPo,
        sum: sum ?? this.sum,
        pembayaran: pembayaran ?? this.pembayaran,
      );
}
