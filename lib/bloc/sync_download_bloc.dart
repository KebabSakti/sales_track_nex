import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'sync_download_event.dart';
part 'sync_download_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final Repository repository;

  SyncBloc(this.repository) : super(SyncStateInit());

  @override
  Stream<SyncState> mapEventToState(
    SyncEvent event,
  ) async* {
    yield SyncLoading();
    var user = await repository.getLoggedInUser();

    if (event is SyncEventInit) {
      yield* _syncData(event, user);
    } else if (event is DeleteAllOutlet) {
      await repository.deleteAllOutlet();
      await repository.deleteTruk();
    }
  }

  Stream<SyncState> _syncData(SyncEventInit event, User user) async* {
    //download outlet ke db lokal
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

    //sync data truk dan stok ke db lokal (driver)
    if (user?.type == "Delivery") {
      //download data truk
      var truk = await repository.getTruk();
      if (truk.length == 0) {
        //download smua data truk ke db lokal
        var response = await repository.downloadTruk(user);

        print(response);

        //data truk dan stok
        for (var item in response['data']) {
          await repository.insertTruk(TrukCompanion.insert(
            id: item['id'],
            nomorPlat: item['nomor_plat'],
            brand: item['brand'],
            createdAt: DateTime.parse(item['created_at']),
            updatedAt: DateTime.parse(item['updated_at']),
          ));

          for (var stok in item['stok']) {
            await repository.insertStok(
              StokCompanion.insert(
                trukId: stok['id'],
                userId: stok['user_id'],
                namaProduk: stok['nama_produk'],
                quantity: stok['quantity'],
                createdAt: DateTime.parse(stok['created_at']),
                updatedAt: DateTime.parse(stok['updated_at']),
              ),
            );
          }
        }

        // yield DownloadTrukCompleted(truks: remoteTruk);
      } else {
        yield DownloadTrukCompleted();
      }
    }

    yield SyncCompleted();
  }
}
