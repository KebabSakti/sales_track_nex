import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'sync_outlet_event.dart';
part 'sync_outlet_state.dart';

class SyncOutletBloc extends Bloc<SyncOutletEvent, SyncOutletState> {
  final Repository repository;

  SyncOutletBloc(this.repository) : super(SyncOutletInitial());

  @override
  Stream<SyncOutletState> mapEventToState(
    SyncOutletEvent event,
  ) async* {
    yield SyncOutletLoading();
    var user = await repository.getLoggedInUser();

    if (event is SyncOutletInit) {
      //cek apakah user sudah download data outlet ke db lokal
      var localOutlets = await repository.getOutlet();
      if (localOutlets.length == 0) {
        //download outlet dari server
        var remoteOutlets = await repository.downloadOutlet(user);
        if (remoteOutlets.length > 0) {
          //simpan data outlet ke db lokal
          for (var item in remoteOutlets) {
            await repository.insertOutlet(OutletCompanion(
              barcode: Value(item.barcode),
              user: Value(item.user),
              outletName: Value(item.outletName),
              lat: Value(item.lat),
              lng: Value(item.lng),
              createdAt: Value(item.createdAt),
              updatedAt: Value(item.updatedAt),
            ));
          }

          yield DownloadOutletComplete();
        }
      } else {
        yield DownloadOutletComplete();
      }
    } 
    else if (event is DeleteAllOutlet) {
      await repository.deleteAllOutlet();
    }
  }
}
