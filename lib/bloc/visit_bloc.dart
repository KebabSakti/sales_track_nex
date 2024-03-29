import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:moor/moor.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/keranjang.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/helper.dart';

part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  VisitBloc(this.repository) : super(VisitInitial());

  final Repository repository;

  @override
  Stream<VisitState> mapEventToState(
    VisitEvent event,
  ) async* {
    if (event is ValidateOutlet) {
      yield* _validateOutlet(event);
    }
    if (event is SubmitVisit) {
      yield* _submitVisit(event);
    }
    if (event is ResetVisitData) {
      yield ResetVisitDataComplete();
    }
  }

  Stream<VisitState> _validateOutlet(ValidateOutlet event) async* {
    List<OutletData> outletData = await repository.getOutletByKeyword(
        event.scanResult, event.user.username);
    if (outletData.length > 0) {
      //cek apakah sudah visit hari ini
      VisitData visitData = await repository.getVisitToday(
        DateTime.now().toIso8601String(),
        event.user.userId,
        outletData[0].outletId,
      );

      if (visitData == null) {
        print('no visit');
        yield ValidateOutletComplete(
            outletData: outletData[0], locationData: event.locationData);
      } else {
        print('already visit');
        //sudah visit
        yield ValidateOutletError(message: 'Outlet sudah di visit hari ini');
      }
    } else {
      yield ValidateOutletError(
          message: 'Outlet belum terdaftar pada database');
    }
  }

  Stream<VisitState> _submitVisit(SubmitVisit event) async* {
    var visitId = Helper().generateRandomId();
    var orderId =
        event.keranjangDetail.sum > 0 ? Helper().generateRandomId() : null;
    var today = DateTime.now();

    //data visit
    await repository.insertVisit(VisitCompanion.insert(
      visitId: visitId,
      orderId: Value(orderId),
      userId: event.user.userId,
      outletId: event.outletData.outletId,
      lat: event.locationData.latitude.toString(),
      lng: event.locationData.longitude.toString(),
      tutup: Value(event.tutup),
      createdAt: today.toIso8601String(),
      updatedAt: today.toIso8601String(),
    ));

    //foto visit
    event.foto.forEach((foto) async {
      await repository.insertFotoVisit(FotoVisitCompanion.insert(
        fotoVisitId: Helper().generateRandomId(),
        visitId: visitId,
        localPath: foto,
        createdAt: today,
        updatedAt: today,
      ));
    });

    if (event.keranjangDetail.sum > 0) {
      //order data
      await repository.insertOrder(SalesCompanion.insert(
        orderId: orderId,
        visitId: Value(visitId),
        outletId: event.outletData.outletId,
        kodeOrder: Helper().generateRandomId(),
        nomorPO: event.keranjangDetail.nomorPo,
        poUserId: event.user.userId,
        totalBayar: event.keranjangDetail.sum.toString(),
        pembayaran: Value(event.keranjangDetail.pembayaran) ?? Value('Cash'),
        barcode: Value(event.outletData.barcode),
        createdAt: today.toIso8601String(),
        updatedAt: Value(today.toIso8601String()),
      ));

      //orderitem
      event.keranjangDetail.keranjangData.forEach((key, value) async {
        await repository.insertOrderItem(OrderItemCompanion.insert(
          orderItemId: Helper().generateRandomId(),
          orderId: orderId,
          produkId: value.produkData.produkId,
          userId: event.user.userId,
          quantity: value.qty,
          totalHarga: value.total.toString(),
          createdAt: today.toIso8601String(),
          updatedAt: today.toIso8601String(),
        ));
      });
    }

    //update jadwal visit outlet
    var jadwal = await repository.getJadwalByDate(
        DateTime.now(), event.user.userId, event.outletData.outletId);

    if (jadwal != null) {
      await repository.updateJadwal(JadwalCompanion.insert(
        jadwalId: jadwal.jadwalId,
        userId: jadwal.userId,
        outletId: jadwal.outletId,
        tanggal: Helper().getFormattedDate(DateTime.now()),
        visit: Value(1),
      ));
    }

    yield SubmitVisitComplete();
  }
}
