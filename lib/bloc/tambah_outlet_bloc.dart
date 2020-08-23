import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/helper.dart';

part 'tambah_outlet_event.dart';
part 'tambah_outlet_state.dart';

class TambahOutletBloc extends Bloc<TambahOutletEvent, TambahOutletState> {
  TambahOutletBloc(this.repository) : super(TambahOutletInitial());

  final Repository repository;

  @override
  Stream<TambahOutletState> mapEventToState(
    TambahOutletEvent event,
  ) async* {
    if (event is ValidateOutlet) {
      yield* _validateOutlet(event);
    } else if (event is InsertNewOutlet) {
      yield* _insertNewOutlet(event);
    } else if (event is ProcessLoading) {
      yield* _processLoading(event);
    }
  }

  Stream<TambahOutletState> _insertNewOutlet(InsertNewOutlet event) async* {
    User user = await repository.getUserLocal();
    //insert outlet
    await repository.insertOutlet(
      OutletCompanion.insert(
        outletId: Helper().generateRandomId(),
        barcode: event.barcode,
        user: user.username,
        outletName: event.namaOutlet,
        lat: event.lat,
        lng: event.lng,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    yield InsertNewOutletComplete();
  }

  Stream<TambahOutletState> _validateOutlet(ValidateOutlet event) async* {
    //cek apakah outlet sudah ada pada database
    List<OutletData> outlets = await repository.getOutletByKeyword(event.qr);
    if (outlets.length == 0)
      yield ValidateOutletComplete();
    else
      yield ValidateOutletError(
          message: 'Outlet sudah terdaftar pada database');
  }

  Stream<TambahOutletState> _processLoading(ProcessLoading event) async* {
    yield ProcessLoadingStatus(event.status);
  }
}
