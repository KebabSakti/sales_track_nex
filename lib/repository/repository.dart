import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/fake_datasource.dart';
import 'package:sales_track_nex/utils/constan.dart';

abstract class AppRepository {
  //user repos
  Future<User> loginRemote(String username, String password);
  Future<User> getLoggedInUser();
  Future<User> validateUserRemote(String username);
  Future<User> validateUserLocal(String username);
  Future insertUserLocal(User user);
  Future updateUserLocal(User user);
  Future<int> deleteUserByUsername(String username);
  Future<int> deleteUsers();

  //outlet repos
  Stream<List<OutletData>> fetchOutlet(String keyword);
  Future<List<OutletData>> getOutlet();
  Future<OutletData> getOutletById(String outletId);
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

  //stok repos
  Future<StokData> getStokById(String stokId);
  Future insertStok(Insertable<StokData> stokData);
  Future updateStok(Insertable<StokData> stokData);
  Future<Map> downloadStok({String syncDate});
  Future deleteStok();

  //produk repos
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

  //visit repos
  Future<Map> downloadVisit({String syncDate});
  Future<List<VisitData>> getVisit();
  Future<VisitData> getVisitById(String visitId);
  Future insertVisit(Insertable<VisitData> visitData);
  Future updateVisit(Insertable<VisitData> visitData);
  Future deleteVisit();

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

  //sync rule
  Future<SyncRule> getRule(String name);
  Future insertRule(Insertable<SyncRule> syncRule);
  Future updateRule(Insertable<SyncRule> syncRule);
  Future deleteRule();
}

class Repository implements AppRepository {
  final NexDatabase database;
  final Dio dio;
  final FakeData fakeDataSource = FakeData();

  Repository(this.database, this.dio);

  @override
  Future<User> getLoggedInUser() {
    return database.userDao.getUser();
  }

  @override
  Future insertUserLocal(User user) async {
    await database.userDao.insertUser(user);
  }

  @override
  Future<User> loginRemote(String username, String password) async {
    Response response = await dio.post(
      "$baseUrl/auth/login",
      options: Options(headers: {
        "Accept": "application/json",
      }),
      data: {
        "username": username,
        "password": password,
      },
    );

    Map data = jsonDecode(response.toString());

    return (data['response'])
        ? User(
            userId: data['data']['user_id'],
            name: data['data']['name'],
            username: data['data']['username'],
            type: data['data']['type'],
            token: data['data']['token'],
          )
        : null;
  }

  @override
  Future updateUserLocal(User user) async {
    await database.userDao.updateUser(user);
  }

  @override
  Future<User> validateUserLocal(String username) {
    return database.userDao.getUserByUsername(username);
  }

  @override
  Future<User> validateUserRemote(String username) async {
    var user = await database.userDao.getUserByUsername(username);
    Response response = await dio.post("$baseUrl/auth/validate",
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}",
        }),
        data: {"username": user.username});

    Map data = jsonDecode(response.toString());

    return (data['response'])
        ? User(
//            id: data['data']['id'],
            userId: data['data']['user_id'],
            name: data['data']['name'],
            username: data['data']['username'],
            type: data['data']['type'],
            token: user.token,
          )
        : null;
  }

  @override
  Future<int> deleteUserByUsername(String username) async {
    return await database.userDao.deleteUserByUsername(username);
  }

  @override
  Future<int> deleteUsers() async {
    return await database.userDao.deleteUsers();
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
    Response response = await dio.post("$baseUrl/sync/outlet",
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
    Response response = await dio.post("$baseUrl/sync/truk",
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
    Response response = await dio.post("$baseUrl/sync/stok",
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
    Response response = await dio.post("$baseUrl/sync/produk",
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
    Response response = await dio.post("$baseUrl/sync/jadwal",
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
    Response response = await dio.post("$baseUrl/sync/order",
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
    Response response = await dio.post("$baseUrl/sync/orderitem",
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
    Response response = await dio.post("$baseUrl/sync/visit",
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
    // TODO: implement getJadwal
    throw UnimplementedError();
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
}
