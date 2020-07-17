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
  Future<int> insertOutlet(Insertable<OutletData> outletData);
  Future<int> updateOutlet(Insertable<OutletData> outletData);
  Future deleteOutlet(Insertable<OutletData> outletData);
  Future deleteAllOutlet();
  Future<List<OutletData>> downloadOutlet(User user);

  //truk repos
  Future<List<TrukData>> getTruk();
  Future<Map> downloadTruk(User user);
  Future insertTruk(Insertable<TrukData> trukData);
  Future uploadTruk(TrukData trukData, User user);
  Future updateTruk(Insertable<TrukData> trukData);
  Future deleteTruk();

  //stok repos
  Future<List<StokData>> getStok(int trukId);
  Future insertStok(Insertable<StokData> stokData);
  Future updateStok(Insertable<StokData> stokData);
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
            id: data['data']['id'],
            username: data['data']['username'],
            type: data['data']['type'],
            token: data['data']['token'],
            hid: data['data']['hid'],
            nomorPlat: data['data']['nomor_plat'],
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
            id: data['data']['id'],
            username: data['data']['username'],
            type: data['data']['type'],
            token: user.token,
            hid: user.hid,
            nomorPlat: data['data']['nomor_plat'],
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
  Future<List<OutletData>> downloadOutlet(User user) async {
    List<OutletData> outlets = [];

    Response response = await dio.post("$baseUrl/outlet/sync",
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}",
        }));

    Map data = jsonDecode(response.toString());

    if (data['response']) {
      for (var item in data['data']) {
        outlets.add(OutletData(
          id: item['id'],
          barcode: item['barcode'],
          user: item['user'],
          outletName: item['name'],
          lat: item['lat'],
          lng: item['lng'],
          geofence: item['geofence'],
          picture: item['picture'],
          createdAt: DateTime.parse(item['created_at']),
          updatedAt: DateTime.parse(item['updated_at']),
        ));
      }

      return outlets;
    } else {
      return null;
    }
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
  Future<Map> downloadTruk(User user) async {
    Response response = await dio.get("$baseUrl/sync/truk",
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}",
        }));

    Map data = jsonDecode(response.toString());

    return data;

    // if (data['response']) {
    //   for (var item in data['data']) {
    //     truks.add(TrukData(
    //       id: item['id'],
    //       nomorPlat: item['nomor_plat'],
    //       brand: item['brand'],
    //       createdAt: DateTime.parse(item['created_at']),
    //       updatedAt: DateTime.parse(item['updated_at']),
    //     ));
    //   }

    //   return truks;
    // } else {
    //   return null;
    // }
  }

  @override
  Future updateTruk(Insertable<TrukData> trukData) {
    // TODO: implement updateTruk
    throw UnimplementedError();
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
  Future<List<StokData>> getStok(int trukId) {
    // TODO: implement getStok
    throw UnimplementedError();
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
}
