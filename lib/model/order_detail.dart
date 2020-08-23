import 'package:flutter/cupertino.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/keranjang.dart';

class OrderDetail {
  final OrderData orderData;
  final List<KeranjangData> keranjangData;

  const OrderDetail({@required this.orderData, this.keranjangData});
}
