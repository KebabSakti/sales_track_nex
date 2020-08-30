import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/keranjang.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/helper.dart';

part 'detail_order_event.dart';
part 'detail_order_state.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  final Repository repository;

  DetailOrderBloc(this.repository) : super(DetailOrderInitial());

  @override
  Stream<DetailOrderState> mapEventToState(
    DetailOrderEvent event,
  ) async* {
    if (event is GetOrderItemData) {
      yield* _getOrderItemData(event);
    } else if (event is SubmitFaktur) {
      yield* _submitFaktur(event);
    }
  }

  Stream<DetailOrderState> _getOrderItemData(GetOrderItemData event) async* {
    var orderItem = await repository
        .fetchOrderItem(event.orderWithOutlet.orderData.orderId);

    orderItem.forEach((item) {
      BlocProvider.of<KeranjangBloc>(event.context).add(
        AddItem(
          KeranjangData(
            produkData: item.produkData,
            qty: item.orderItemData.quantity,
            total: double.parse(item.orderItemData.totalHarga),
            orderItemData: item.orderItemData,
          ),
        ),
      );
    });
  }

  Stream<DetailOrderState> _submitFaktur(SubmitFaktur event) async* {
    //item order
    event.keranjangDetail.keranjangData.forEach((key, value) async {
      if (value.orderItemData == null) {
        //insert
        await repository.insertOrderItem(OrderItemCompanion.insert(
          orderItemId: Helper().generateRandomId(),
          orderId: event.orderData.orderId,
          produkId: value.produkData.produkId,
          userId: event.user.userId,
          quantity: value.qty,
          totalHarga: value.total.toString(),
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        ));
      } else {
        //update
        await repository.updateOrderItem(OrderItemCompanion.insert(
          orderItemId: value.orderItemData.orderItemId,
          orderId: event.orderData.orderId,
          produkId: value.produkData.produkId,
          userId: event.user.userId,
          quantity: value.qty,
          totalHarga: value.total.toString(),
          createdAt: value.orderItemData.createdAt,
          updatedAt: DateTime.now().toIso8601String(),
        ));
      }
    });

    //order data
    await repository.updateOrder(SalesCompanion.insert(
      orderId: event.orderData.orderId,
      visitId: Value(event.orderData.visitId),
      pembayaran: Value(event.orderData.pembayaran),
      barcode: Value(event.orderData.barcode),
      status: Value('FAKTUR'),
      fakturUserId: Value(Helper().generateRandomId()),
      nomorFaktur: Value(Helper().generateIdWithPrefix('FT')),
      outletId: event.orderData.outletId,
      kodeOrder: event.orderData.kodeOrder,
      nomorPO: event.orderData.nomorPO,
      poUserId: event.orderData.poUserId,
      totalBayar: event.keranjangDetail.sum.toString(),
      createdAt: event.orderData.createdAt,
      updatedAt: Value(DateTime.now().toIso8601String()),
    ));

    yield SubmitFakturComplete();
  }
}
