import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'order_product_event.dart';
part 'order_product_state.dart';

class OrderProductBloc extends Bloc<OrderProductEvent, OrderProductState> {
  OrderProductBloc(this.repository) : super(OrderProductInitial());

  final Repository repository;

  @override
  Stream<OrderProductState> mapEventToState(
    OrderProductEvent event,
  ) async* {
    yield GetOrderProductLoading();

    if (event is GetOrderProduct) {
      yield* _getOrderProduct(event);
    } else if (event is ToggleProductSearch) {
      yield* _toggleProductSearch(event);
    }
  }

  Stream<OrderProductState> _getOrderProduct(GetOrderProduct event) async* {
    List<ProdukData> product = [];

    if (event.user.type == 'Sales') {
      product = await repository.getProdukByKeyword(
        event.keyword,
        limit: event.limit,
        offset: event.offset,
      );
    } else {
      var productWithStok = await repository.getStokWithProduct(
          event.user.truckId, event.keyword);

      for (var item in productWithStok) {
        product.add(ProdukData(
          produkId: item.produkData.produkId,
          kode: item.produkData.kode,
          nama: item.produkData.nama,
          harga: item.produkData.harga,
          stok: item.stokData.quantity,
          aktif: item.produkData.aktif,
          createdAt: item.stokData.createdAt,
          updatedAt: item.stokData.updatedAt,
        ));
      }
    }

    if (product.length > 0) {
      yield GetOrderProductComplete(product: product);
    } else {
      yield GetOrderProductError(message: 'Belum ada produk pada database');
    }
  }

  Stream<OrderProductState> _toggleProductSearch(
      ToggleProductSearch event) async* {
    yield ToggleProductSearchComplete(event.status);
  }
}
