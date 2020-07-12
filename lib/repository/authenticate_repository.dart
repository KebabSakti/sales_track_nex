import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/utils/constan.dart';

abstract class AbstractAuthenticate {
  Future<User> loginRemote(String username, String password);
  Future<User> getLoggedInUser();
  Future<User> validateUserRemote(String username);
  Future<User> validateUserLocal(String username);
  Future insertUserLocal(User user);
  Future updateUserLocal(User user);
  Future<int> deleteUserByUsername(String username);
  Future<int> deleteUsers();
}

class AuthenticateRepository implements AbstractAuthenticate {
  final NexDatabase database;
  final Dio dio;

  AuthenticateRepository(this.database, this.dio);

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
      onSendProgress: (int sent, int total) {
        print('$sent $total');
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
            nomor_plat: data['data']['nomor_plat'],
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
            nomor_plat: data['data']['nomor_plat'],
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
}
