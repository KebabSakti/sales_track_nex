import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moor/moor.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/helper.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SyncBloc(this.repository) : super(SyncInitial());

  final Repository repository;

  @override
  Stream<SyncState> mapEventToState(
    SyncEvent event,
  ) async* {
    yield SyncLoading(message: "mulai sync");

    if (event is Sync) {
      yield* _syncOutlet(event);
      yield* _syncTruk(event);
      yield* _syncStok(event);
      yield* _syncProduk(event);
      yield* _syncJadwal(event);
      yield* _syncOrder(event);
      yield* _syncOrderItem(event);
//      yield* _syncVisit(event);
      yield* _syncInfo(event);

      yield SyncCompleted();
    } else if (event is Reset) {
      await repository.deleteAllOutlet();
      await repository.deleteTruk();
      await repository.deleteRule();
      await repository.deleteStok();
      await repository.deleteProduk();
      await repository.deleteUsers();

      print('Reset Successful');
    } else if (event is ShouldSync) {
      yield* _shouldSync(event);
    }
  }

  Stream<SyncState> _syncOutlet(Sync event) async* {
    yield SyncLoading(message: 'sync outlet');

    String syncDate;
    SyncRule syncRuleOutlet = await _getSyncRule("outlet");
    //sync outlet
    Map downloadOutlet =
        await repository.downloadOutlet(syncDate: syncRuleOutlet?.syncDate);

    if (downloadOutlet['response']) {
      for (var item in downloadOutlet['data']) {
        OutletData outlet = await repository.getOutletById(item['outlet_id']);

        Insertable<OutletData> outletData = OutletCompanion.insert(
          outletId: item['outlet_id'],
          barcode: item['barcode'],
          user: item['user'],
          outletName: item['name'],
          address: Value(item['address']),
          phone: Value(item['phone']),
          geofence: Value(item['geofence']),
          owner: Value(item['owner']),
          picture: Value(item['picture']),
          lat: item['lat'],
          lng: item['lng'],
          createdAt: DateTime.parse(item['created_at']),
          updatedAt: DateTime.parse(item['updated_at']),
        );

        if (outlet == null) {
          //insert
          await repository.insertOutlet(outletData);
        } else {
          //update
          await repository.updateOutlet(outletData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'outlet', syncRuleOutlet);
    }

    yield SyncLoading(message: 'sync outlet selesai');
  }

  Stream<SyncState> _syncTruk(Sync event) async* {
    yield SyncLoading(message: 'sync truk');

    String syncDate;
    //sync truk data
    SyncRule syncRuleTruk = await _getSyncRule('truk');
    Map downloadTruk =
        await repository.downloadTruk(syncDate: syncRuleTruk?.syncDate);

    if (downloadTruk['response']) {
      for (var item in downloadTruk['data']) {
        TrukData truk = await repository.getTrukById(item['truck_id']);

        Insertable<TrukData> trukData = TrukCompanion.insert(
          trukId: item['truck_id'],
          nomorPlat: item['nomor_plat'],
          brand: item['brand'],
          createdAt: item['created_at'],
          updatedAt: item['updated_at'],
        );

        if (truk == null) {
          //insert
          await repository.insertTruk(trukData);
        } else {
          //update
          await repository.updateTruk(trukData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'truk', syncRuleTruk);
    }

    yield SyncLoading(message: 'sync truk selesai');
  }

  Stream<SyncState> _syncStok(Sync event) async* {
    yield SyncLoading(message: 'sync stok');

    String syncDate;
    //sync stok data
    SyncRule syncRuleStok = await _getSyncRule('stok');
    Map downloadStok =
        await repository.downloadStok(syncDate: syncRuleStok?.syncDate);

    if (downloadStok['response']) {
      for (var item in downloadStok['data']) {
        StokData stok = await repository.getStokById(item['truck_id']);

        Insertable<StokData> stokData = StokCompanion.insert(
          trukId: item['truck_id'],
          stokId: item['stok_id'],
          produkId: item['produk_id'],
          quantity: item['quantity'],
          createdAt: item['created_at'],
          updatedAt: item['updated_at'],
        );

        if (stok == null) {
          //insert
          await repository.insertStok(stokData);
        } else {
          //update
          await repository.updateStok(stokData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'stok', syncRuleStok);
    }

    yield SyncLoading(message: 'sync stok selesai');
  }

  Stream<SyncState> _syncProduk(Sync event) async* {
    yield SyncLoading(message: 'sync produk');

    String syncDate;
    //sync stok data
    SyncRule syncRuleProduk = await _getSyncRule('produk');
    Map downloadProduk =
        await repository.downloadProduk(syncDate: syncRuleProduk?.syncDate);

    if (downloadProduk['response']) {
      for (var item in downloadProduk['data']) {
        ProdukData produk = await repository.getProdukById(item['produk_id']);

        Insertable<ProdukData> produkData = ProdukCompanion.insert(
          produkId: item['produk_id'],
          kode: item['kode'],
          nama: item['nama'],
          harga: item['harga'],
          stok: int.parse(item['stok']),
          createdAt: item['created_at'],
          updatedAt: item['updated_at'],
        );

        if (produk == null) {
          //insert
          await repository.insertProduk(produkData);
        } else {
          //update
          await repository.updateProduk(produkData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'produk', syncRuleProduk);
    }

    yield SyncLoading(message: 'sync produk selesai');
  }

  Stream<SyncState> _syncJadwal(Sync event) async* {
    yield SyncLoading(message: 'sync jadwal visit');

    String syncDate;
    //sync jadwal data
    SyncRule syncRuleJadwal = await _getSyncRule('jadwal');
    Map downloadJadwal =
        await repository.downloadJadwal(syncDate: syncRuleJadwal?.syncDate);

    if (downloadJadwal['response']) {
      for (var item in downloadJadwal['data']) {
        JadwalData jadwal = await repository.getJadwalById(item['produk_id']);

        Insertable<JadwalData> jadwalData = JadwalCompanion.insert(
          jadwalId: item['jadwal_id'],
          userId: item['user_id'],
          outletId: item['outlet_id'],
          tanggal: item['tanggal'],
          createdAt: DateTime.parse(item['created_at']),
          updatedAt: DateTime.parse(item['updated_at']),
        );

        if (jadwal == null) {
          //insert
          await repository.insertJadwal(jadwalData);
        } else {
          //update
          await repository.updateJadwal(jadwalData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'jadwal', syncRuleJadwal);
    }

    yield SyncLoading(message: 'sync jadwal visit selesai');
  }

  Stream<SyncState> _syncOrder(Sync event) async* {
    yield SyncLoading(message: 'sync order');

    String syncDate;
    //sync order data
    SyncRule syncRuleOrder = await _getSyncRule('order');
    Map downloadOrder =
        await repository.downloadOrder(syncDate: syncRuleOrder?.syncDate);

    if (downloadOrder['response']) {
      for (var item in downloadOrder['data']) {
        OrderData order = await repository.getOrderById(item['order_id']);

        Insertable<OrderData> orderData = OrderCompanion.insert(
          orderId: item['order_id'],
          outletId: item['outlet_id'],
          kodeOrder: item['kode_order'],
          nomorPO: item['nomor_po'],
          poUserId: item['po_user_id'],
          nomorFaktur: item['nomor_faktur'],
          fakturUserId: item['faktur_user_id'],
          totalBayar: item['total_bayar'],
          pembayaran: item['pembayaran'],
          status: item['status'],
          createdAt: item['created_at'],
          updatedAt: item['updated_at'],
        );

        if (order == null) {
          //insert
          await repository.insertOrder(orderData);
        } else {
          //update
          await repository.updateOrder(orderData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'order', syncRuleOrder);
    }

    yield SyncLoading(message: 'sync order selesai');
  }

  Stream<SyncState> _syncOrderItem(Sync event) async* {
    yield SyncLoading(message: 'sync order');

    String syncDate;
    //sync order data
    SyncRule syncRuleOrderItem = await _getSyncRule('order_item');
    Map downloadOrderItem = await repository.downloadOrderItem(
        syncDate: syncRuleOrderItem?.syncDate);

    if (downloadOrderItem['response']) {
      for (var item in downloadOrderItem['data']) {
        OrderItemData orderItem =
            await repository.getOrderItemById(item['order_item_id']);

        Insertable<OrderItemData> orderItemData = OrderItemCompanion.insert(
          orderItemId: item['order_item_id'],
          orderId: item['order_id'],
          produkId: item['produk_id'],
          kodeOrder: item['kode_produk'],
          userId: item['user_id'],
          quantity: int.parse(item['quantity']),
          totalHarga: item['total_harga'],
          createdAt: item['created_at'],
          updatedAt: item['updated_at'],
        );

        if (orderItem == null) {
          //insert
          await repository.insertOrderItem(orderItemData);
        } else {
          //update
          await repository.updateOrderItem(orderItemData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'order_item', syncRuleOrderItem);
    }

    yield SyncLoading(message: 'sync order selesai');
  }

  Stream<SyncState> _syncVisit(Sync event) async* {
    yield SyncLoading(message: 'sync data visit');

    String syncDate;
    //sync order data
    SyncRule syncRuleVisit = await _getSyncRule('visit');
    Map downloadVisit =
        await repository.downloadVisit(syncDate: syncRuleVisit?.syncDate);

    if (downloadVisit['response']) {
      for (var item in downloadVisit['data']) {
        VisitData visit = await repository.getVisitById(item['visit_id']);

        Insertable<VisitData> visitData = VisitCompanion.insert(
          visitId: item['visit_id'],
          userId: item['user_id'],
          outletId: item['outlet_id'],
          lat: item['lat'],
          lng: item['lng'],
          createdAt: item['created_at'],
          updatedAt: item['updated_at'],
        );

        if (visit == null) {
          //insert
          await repository.insertVisit(visitData);
        } else {
          //update
          await repository.updateVisit(visitData);
        }

        syncDate = item['updated_at'];
      }

      //update sync rule outlet
      _updateSyncRule(syncDate, 'visit', syncRuleVisit);
    }

    yield SyncLoading(message: 'sync data visit selesai');
  }

  Future<SyncRule> _getSyncRule(String target) async {
    return await repository.getRule(target);
  }

  Future _updateSyncRule(
      String syncDate, String target, SyncRule syncRule) async {
    print(syncRule?.syncDate);

    //sync rule outlet
    Insertable<SyncRule> syncRuledata = SyncRuleTableCompanion.insert(
      syncId: syncRule?.syncId ?? Helper().generateRandomId(),
      target: target,
      syncDate: syncDate,
    );

    if (syncRule == null) {
      await repository.insertRule(syncRuledata);
    } else {
      await repository.updateRule(syncRuledata);
    }
  }

  Stream<SyncState> _syncInfo(Sync event) async* {
    SyncInfoData syncInfoData = await repository.getSyncInfo();
//    var dateFormat = DateFormat('yyyy-MM-dd');
//    var now = dateFormat.format(DateTime.now());
    var now = DateTime.now().toUtc();

    if (syncInfoData == null) {
      //insert
      await repository.insertSyncInfo(
        SyncInfoCompanion.insert(
          syncInfoId: Helper().generateRandomId(),
          updatedAt: now,
        ),
      );
    } else {
      //update
      await repository.updateSyncInfo(
        SyncInfoCompanion.insert(
          syncInfoId: syncInfoData.syncInfoId,
          updatedAt: now,
        ),
      );
    }
  }

  Stream<SyncState> _shouldSync(ShouldSync event) async* {
    SyncInfoData syncInfoData = await repository.getSyncInfo();

    if (syncInfoData == null) {
      yield ShouldSyncResponse(true);
    } else {
      var utc = DateTime.now().toUtc();
      var dateNow = DateTime.utc(utc.year, utc.month, utc.day);
      var diff = dateNow.compareTo(syncInfoData.updatedAt);

      if (diff > 0) {
        yield ShouldSyncResponse(true);
      } else {
        yield ShouldSyncResponse(false);
      }
    }
  }
}
