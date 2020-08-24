import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/utils/constan.dart';

abstract class AppRepository {
  //user repos
  Future<Map> loginRemote(String username, String password);
  Future<User> getLoggedInUser();
  Future<Map> validateUserRemote(String username);
  Future<User> validateUserLocal(String username);
  Future<User> getUserLocal();
  Future insertUserLocal(Insertable<User> user);
  Future updateUserLocal(Insertable<User> user);
  Future deleteUserByUsername(String username);
  Future deleteUsers();
  Future setTrukId(String trukId, String username);

  //outlet repos
  Stream<List<OutletData>> fetchOutlet(String keyword);
  Future<List<OutletData>> getOutlet();
  Future<OutletData> getOutletById(String outletId);
  Future<List<OutletData>> getOutletByKeyword(String keyword);
  Future<int> insertOutlet(Insertable<OutletData> outletData);
  Future<int> updateOutlet(Insertable<OutletData> outletData);
  Future deleteOutlet(Insertable<OutletData> outletData);
  Future deleteAllOutlet();
  Future<Map> downloadOutlet({String syncDate});

  //truk repos
  Future<List<TrukData>> getTruk();
  Future<TrukData> getTrukById(String trukId);
  Future<Map> downloadTruk({String syncDate});
  Future insertTruk(Insertable<TrukData> trukData);
  Future uploadTruk(TrukData trukData, User user);
  Future updateTruk(Insertable<TrukData> trukData);
  Future deleteTruk();
  Future<List<TrukWithStokSum>> getTrukWithStokSum();
  Future<Map> setTruk(String truckId);

  //stok repos
  Future<StokData> getStokById(String stokId);
  Future insertStok(Insertable<StokData> stokData);
  Future updateStok(Insertable<StokData> stokData);
  Future<Map> downloadStok({String syncDate});
  Future deleteStok();

  //produk repos
  Future<List<ProdukData>> getProduk();
  Future<List<ProdukData>> getProdukByKeyword(String keyword,
      {int limit, int offset});
  Future<ProdukData> getProdukById(String produkId);
  Future insertProduk(Insertable<ProdukData> produkData);
  Future updateProduk(Insertable<ProdukData> produkData);
  Future deleteProduk();
  Future<Map> downloadProduk({String syncDate});

  //jadwal repos
  Future<Map> downloadJadwal({String syncDate});
  Future<List<JadwalData>> getJadwal();
  Future<JadwalData> getJadwalById(String jadwalId);
  Future insertJadwal(Insertable<JadwalData> jadwalData);
  Future updateJadwal(Insertable<JadwalData> jadwalData);
  Future deleteJadwal();
  Future<List<JadwalWithOutlet>> getJadwalWithOutlet(
      String userId, DateTime dateTime);
  Future<Map> getJadwalWithRange(String originLat, String originLng,
      String destinationLat, String destinationLng);
  Future<JadwalData> getJadwalByDate(
      DateTime dateTime, String userId, String outletId);

  //visit repos
  Future<Map> downloadVisit({String syncDate});
  Future<List<VisitData>> getVisit();
  Future<VisitData> getVisitById(String visitId);
  Future<VisitData> getVisitToday(
      String dateTime, String userId, String outletId);
  Future insertVisit(Insertable<VisitData> visitData);
  Future updateVisit(Insertable<VisitData> visitData);
  Future deleteVisit();
  Future<List<VisitWithOutlet>> getVisitWithOutlet(
    String userId,
    String keyword,
    String periodeAwal,
    String periodeAkhir,
  );

  //order repos
  Future<Map> downloadOrder({String syncDate});
  Future<List<OrderData>> getOrder();
  Future<OrderData> getOrderById(String orderId);
  Future insertOrder(Insertable<OrderData> orderData);
  Future updateOrder(Insertable<OrderData> orderData);
  Future deleteOrder();

  //order item repos
  Future<Map> downloadOrderItem({String syncDate});
  Future<List<OrderItemData>> getOrderItem();
  Future<OrderItemData> getOrderItemById(String orderItemId);
  Future insertOrderItem(Insertable<OrderItemData> orderItemData);
  Future updateOrderItem(Insertable<OrderItemData> orderItemData);
  Future deleteOrderItem();

  //foto visit
  Future<FotoVisitData> getFotoVisitById(String fotoVisitId);
  Future<List<FotoVisitData>> getFotoVisitByVisitId(String visitId);
  Future insertFotoVisit(Insertable<FotoVisitData> fotoVisitData);
  Future updateFotoVisit(Insertable<FotoVisitData> fotoVisitData);

  //sync rule
  Future<SyncRule> getRule(String name);
  Future insertRule(Insertable<SyncRule> syncRule);
  Future updateRule(Insertable<SyncRule> syncRule);
  Future deleteRule();

  //sync info
  Future<SyncInfoData> getSyncInfo();
  Future insertSyncInfo(Insertable<SyncInfoData> syncInfoData);
  Future updateSyncInfo(Insertable<SyncInfoData> syncInfoData);
  Future deleteSyncInfo();

  //scanner
  Future<ScanResult> scanBarcode();

  //location
  Future<LocationData> getSingleLocation();
}

class Repository implements AppRepository {
  final Location location;
  final NexDatabase database;
  final Dio dio;

  Repository(this.location, this.database, this.dio);

  @override
  Future<User> getLoggedInUser() {
    return database.userDao.getUser();
  }

  @override
  Future insertUserLocal(Insertable<User> user) async {
    await database.userDao.insertUser(user);
  }

  @override
  Future<Map> loginRemote(String username, String password) async {
    Response response = await dio.post(
      "/auth/login",
      options: Options(headers: {
        "Accept": "application/json",
      }),
      data: {
        "username": username,
        "password": password,
      },
    );

    return jsonDecode(response.toString());
  }

  @override
  Future updateUserLocal(Insertable<User> user) async {
    await database.userDao.updateUser(user);
  }

  @override
  Future<User> validateUserLocal(String username) {
    return database.userDao.getUserByUsername(username);
  }

  @override
  Future<Map> validateUserRemote(String username) async {
    User user = await database.userDao.getUserByUsername(username);
    Response response = await dio.post("/auth/validate",
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}",
        }),
        data: {"username": user.username});

    return jsonDecode(response.toString());
  }

  @override
  Future deleteUserByUsername(String username) async {
    await database.userDao.deleteUserByUsername(username);
  }

  @override
  Future deleteUsers() async {
    await database.userDao.deleteUsers();
  }

  @override
  Future deleteOutlet(Insertable<OutletData> outletData) {
    // TODO: implement deleteOutlet
    throw UnimplementedError();
  }

  @override
  Future deleteAllOutlet() async {
    await database.outletDao.deleteAllOutlet();

    print('ALL OUTLET DELETED');
  }

  @override
  Future<Map> downloadOutlet({String syncDate}) async {
    Response response = await dio.post("/sync/outlet",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {"sync_date": syncDate});

    return jsonDecode(response.toString());
  }

  @override
  Stream<List<OutletData>> fetchOutlet(String keyword) {
    return database.outletDao.fetchOutlet(keyword);
  }

  @override
  Future<List<OutletData>> getOutlet() {
    return database.outletDao.getOutlet();
  }

  @override
  Future<int> insertOutlet(Insertable<OutletData> outletData) {
    return database.outletDao.insertOutlet(outletData);
  }

  @override
  Future<int> updateOutlet(Insertable<OutletData> outletData) {
    // TODO: implement updateOutlet
    throw UnimplementedError();
  }

  @override
  Future<List<TrukData>> getTruk() async {
    return database.trukDao.getTruk();
  }

  @override
  Future deleteTruk() async {
    await database.trukDao.deleteTruk();
    print('ALL TRUK DELETED');
  }

  @override
  Future<Map> downloadTruk({String syncDate}) async {
    Response response = await dio.post("/sync/truk",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future updateTruk(Insertable<TrukData> trukData) async {
    await database.trukDao.updateTruk(trukData);
  }

  @override
  Future uploadTruk(TrukData trukData, User user) {
    // TODO: implement uploadTruk
    throw UnimplementedError();
  }

  @override
  Future insertTruk(Insertable<TrukData> trukData) async {
    await database.trukDao.insertTruk(trukData);
  }

  @override
  Future<StokData> getStokById(String stokId) async {
    return await database.stokDao.getStokById(stokId);
  }

  @override
  Future insertStok(Insertable<StokData> stokData) async {
    await database.stokDao.insertStok(stokData);
  }

  @override
  Future updateStok(Insertable<StokData> stokData) {
    // TODO: implement updateStok
    throw UnimplementedError();
  }

  @override
  Future<SyncRule> getRule(String name) async {
    return await database.syncRuleDao.getRule(name);
  }

  @override
  Future insertRule(Insertable<SyncRule> syncRule) async {
    await database.syncRuleDao.insertRule(syncRule);
  }

  @override
  Future updateRule(Insertable<SyncRule> syncRule) async {
    await database.syncRuleDao.updateRule(syncRule);
  }

  @override
  Future deleteRule() async {
    await database.syncRuleDao.deleteRule();
    print('ALL RULE DELETED');
  }

  @override
  Future<TrukData> getTrukById(String trukId) async {
    return await database.trukDao.getTrukByid(trukId);
  }

  @override
  Future<Map> downloadStok({String syncDate}) async {
    Response response = await dio.post("/sync/stok",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future<OutletData> getOutletById(String outletId) async {
    return await database.outletDao.getOutletById(outletId);
  }

  @override
  Future deleteStok() async {
    await database.stokDao.deleteStok();

    print('ALL STOK DELETED');
  }

  @override
  Future deleteProduk() async {
    await database.produkDao.deleteProduk();

    print('ALL PRODUK DELETED');
  }

  @override
  Future<Map> downloadProduk({String syncDate}) async {
    Response response = await dio.post("/sync/produk",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future<ProdukData> getProdukById(String produkId) async {
    return await database.produkDao.getProdukById(produkId);
  }

  @override
  Future insertProduk(Insertable<ProdukData> produkData) async {
    await database.produkDao.insertProduk(produkData);
  }

  @override
  Future updateProduk(Insertable<ProdukData> produkData) async {
    await database.produkDao.updateProduk(produkData);
  }

  @override
  Future deleteJadwal() async {
    await database.jadwalDao.deleteJadwal();
  }

  @override
  Future deleteOrder() {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future deleteOrderItem() {
    // TODO: implement deleteOrderItem
    throw UnimplementedError();
  }

  @override
  Future deleteVisit() {
    // TODO: implement deleteVisit
    throw UnimplementedError();
  }

  @override
  Future<Map> downloadJadwal({String syncDate}) async {
    Response response = await dio.post("/sync/jadwal",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future<Map> downloadOrder({String syncDate}) async {
    Response response = await dio.post("/sync/order",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future<Map> downloadOrderItem({String syncDate}) async {
    Response response = await dio.post("/sync/orderitem",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future<Map> downloadVisit({String syncDate}) async {
    Response response = await dio.post("/sync/visit",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: {
          "sync_date": syncDate,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future<List<JadwalData>> getJadwal() {
    return database.jadwalDao.getJadwal();
  }

  @override
  Future<JadwalData> getJadwalById(String jadwalId) async {
    return await database.jadwalDao.getJadwalById(jadwalId);
  }

  @override
  Future<List<OrderData>> getOrder() {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<OrderData> getOrderById(String orderId) async {
    return await database.orderDao.getOrderById(orderId);
  }

  @override
  Future<List<OrderItemData>> getOrderItem() {
    // TODO: implement getOrderItem
    throw UnimplementedError();
  }

  @override
  Future<OrderItemData> getOrderItemById(String orderItemId) async {
    return await database.orderItemDao.getOrderItemById(orderItemId);
  }

  @override
  Future<List<VisitData>> getVisit() {
    // TODO: implement getVisit
    throw UnimplementedError();
  }

  @override
  Future<VisitData> getVisitById(String visitId) async {
    return await database.visitDao.getVisitById(visitId);
  }

  @override
  Future insertJadwal(Insertable<JadwalData> jadwalData) async {
    await database.jadwalDao.insertJadwal(jadwalData);
  }

  @override
  Future insertOrder(Insertable<OrderData> orderData) async {
    await database.orderDao.insertOrder(orderData);
  }

  @override
  Future insertOrderItem(Insertable<OrderItemData> orderItemData) async {
    await database.orderItemDao.insertOrderItem(orderItemData);
  }

  @override
  Future insertVisit(Insertable<VisitData> visitData) async {
    await database.visitDao.insertVisit(visitData);
  }

  @override
  Future updateJadwal(Insertable<JadwalData> jadwalData) async {
    await database.jadwalDao.updateJadwal(jadwalData);
  }

  @override
  Future updateOrder(Insertable<OrderData> orderData) async {
    await database.orderDao.updateOrder(orderData);
  }

  @override
  Future updateOrderItem(Insertable<OrderItemData> orderItemData) async {
    await database.orderItemDao.updateOrderItem(orderItemData);
  }

  @override
  Future updateVisit(Insertable<VisitData> visitData) async {
    await database.visitDao.updateVisit(visitData);
  }

  @override
  Future<List<TrukWithStokSum>> getTrukWithStokSum() async {
    return await database.trukDao.getTrukWithStokSum();
  }

  @override
  Future<Map> setTruk(String truckId) async {
    User user = await getLoggedInUser();
    Response response = await dio.post("/util/set/truk",
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}",
        }),
        data: {
          "username": user.username,
          "truck_id": truckId,
        });

    return jsonDecode(response.toString());
  }

  @override
  Future setTrukId(String trukId, String username) async {
    await database.userDao.setTrukId(trukId, username);
  }

  @override
  Future<User> getUserLocal() async {
    return await database.userDao.getUser();
  }

  @override
  Future<SyncInfoData> getSyncInfo() async {
    return await database.syncInfoDao.getSyncInfo();
  }

  @override
  Future insertSyncInfo(Insertable<SyncInfoData> syncInfoData) async {
    await database.syncInfoDao.insertSyncInfo(syncInfoData);
  }

  @override
  Future updateSyncInfo(Insertable<SyncInfoData> syncInfoData) async {
    await database.syncInfoDao.updateSyncInfo(syncInfoData);
  }

  @override
  Future<List<JadwalWithOutlet>> getJadwalWithOutlet(
      String userId, DateTime dateTime) async {
    return await database.jadwalDao.getJadwalWithOutlet(userId, dateTime);
  }

  @override
  Future<Map> getJadwalWithRange(String originLat, String originLng,
      String destinationLat, String destinationLng) async {
    var mDio = Dio();
    mDio.options.baseUrl = hereMap;
    Response response = await mDio.get(
        '/routes?transportMode=car&origin=$originLat,$originLng&destination=$destinationLat,$destinationLng&return=summary&apiKey=_7lZezRcEwDHkCj4mjrul2qJzmjWIQmhx7nEFoK76_Q');

    return jsonDecode(response.toString());
  }

  @override
  Future<ScanResult> scanBarcode() async {
    return await BarcodeScanner.scan();
  }

  @override
  Future<List<OutletData>> getOutletByKeyword(String keyword) async {
    return await database.outletDao.getOutletByKeyword(keyword);
  }

  @override
  Future<LocationData> getSingleLocation() async {
    return await location.getLocation();
  }

  @override
  Future<FotoVisitData> getFotoVisitById(String fotoVisitId) {
    // TODO: implement getFotoVisitById
    throw UnimplementedError();
  }

  @override
  Future<List<FotoVisitData>> getFotoVisitByVisitId(String visitId) {
    // TODO: implement getFotoVisitByVisitId
    throw UnimplementedError();
  }

  @override
  Future insertFotoVisit(Insertable<FotoVisitData> fotoVisitData) async {
    await database.fotoVisitDao.insertFotoVisit(fotoVisitData);
  }

  @override
  Future updateFotoVisit(Insertable<FotoVisitData> fotoVisitData) {
    // TODO: implement updateFotoVisit
    throw UnimplementedError();
  }

  @override
  Future<VisitData> getVisitToday(
      String dateTime, String userId, String outletId) async {
    return await database.visitDao.getVisitToday(dateTime, userId, outletId);
  }

  @override
  Future<List<ProdukData>> getProduk() async {
    return await database.produkDao.getProduk();
  }

  @override
  Future<List<ProdukData>> getProdukByKeyword(String keyword,
      {int limit, int offset}) async {
    return await database.produkDao
        .getProdukByKeyword(keyword, limit: limit, offset: offset);
  }

  @override
  Future<JadwalData> getJadwalByDate(
      DateTime dateTime, String userId, String outletId) async {
    return await database.jadwalDao.getJadwalByDate(dateTime, userId, outletId);
  }

  @override
  Future deleteSyncInfo() async {
    await database.syncInfoDao.deleteSyncInfo();
  }

  @override
  Future<List<VisitWithOutlet>> getVisitWithOutlet(String userId,
      String keyword, String periodeAwal, String periodeAkhir) async {
    return await database.visitDao.getVisitWithOutlet(
      userId,
      keyword,
      periodeAwal,
      periodeAkhir,
    );
  }
}
