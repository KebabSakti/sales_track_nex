import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/model/keranjang.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/helper.dart';

part 'keranjang_event.dart';
part 'keranjang_state.dart';

class KeranjangBloc extends Bloc<KeranjangEvent, KeranjangState> {
  final Repository repository;

  KeranjangBloc(this.repository)
      : super(KeranjangInitial(KeranjangDetail(keranjangData: {}, sum: 0)));

  @override
  Stream<KeranjangState> mapEventToState(
    KeranjangEvent event,
  ) async* {
    if (event is AddItem) {
      yield* _addItem(event);
    } else if (event is SetPembayaran) {
      yield* _setPembayaran(event);
    } else if (event is SetNomorPo) {
      yield* _setNomorPo(event);
    } else if (event is Resetkeranjang) {
      yield ResetKeranjangComplete(KeranjangDetail(keranjangData: {}, sum: 0));
    }
  }

  Stream<KeranjangState> _addItem(AddItem event) async* {
    print('QTY IS ${event.keranjangData.qty}');

    Map<String, KeranjangData> keranjangData = {};

    if (event.keranjangData.qty == 0) {
      state.keranjangDetail.keranjangData
          .remove(event.keranjangData.produkData.produkId);
    }

    state.keranjangDetail.keranjangData.forEach((key, value) {
      keranjangData[key] = value;
    });

    if (event.keranjangData.qty != 0) {
      keranjangData[event.keranjangData.produkData.produkId] =
          event.keranjangData;
    }

    double sum = 0;
    keranjangData.forEach((key, value) {
      sum += keranjangData[key].total;
    });

    yield KeranjangStatus(
        KeranjangDetail(keranjangData: keranjangData, sum: sum));
  }

  Stream<KeranjangState> _setPembayaran(SetPembayaran event) async* {
    yield KeranjangStatus(
        state.keranjangDetail.copyWith(pembayaran: event.pembayaran));
  }

  Stream<KeranjangState> _setNomorPo(SetNomorPo event) async* {
    yield KeranjangStatus(state.keranjangDetail
        .copyWith(nomorPo: Helper().generateIdWithPrefix('PO')));
  }
}
