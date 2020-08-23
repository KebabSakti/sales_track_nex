import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final Repository repository;

  AuthenticateBloc(this.repository) : super(null);

  @override
  Stream<AuthenticateState> mapEventToState(
    AuthenticateEvent event,
  ) async* {
    yield AuthenticateLoading(message: "sync data");

    if (event is GetLoggedInUser) {
      yield* _getLoggedInUser(event);
    } else if (event is LoginRemote) {
      yield* _loginRemote(event);
    } else if (event is DeleteUserLocal) {
      yield* _deleteUserLocal(event);
    } else if (event is DeleteAllUserLocal) {
      yield* _deleteAllUserLocal(event);
    } else if (event is GetUserLocal) {
      yield* _getUserLocal();
    } else if (event is SetTruck) {
      yield* _setTruck(event);
    }
  }

  Stream<AuthenticateState> _getLoggedInUser(GetLoggedInUser event) async* {
    yield AuthenticateLoading(message: "otentikasi user");
    //cek user pada db lokal
    User localUser = await repository.getLoggedInUser();
    if (localUser != null) {
      //validasi user remote
      Map response = await repository.validateUserRemote(localUser.username);
      if (response['response']) {
        //update data user lokal
        await repository.updateUserLocal(UsersCompanion.insert(
          userId: response['data']['user_id'],
          name: response['data']['name'],
          username: response['data']['username'],
          type: response['data']['type'],
          token: localUser.token,
        ));

        yield GetLoggedInUserCompleted(localUser);
      }
    } else {
      yield AuthenticateError();
    }
  }

  Stream<AuthenticateState> _loginRemote(LoginRemote event) async* {
    Map remoteUser =
        await repository.loginRemote(event.username, event.password);
    if (remoteUser['response']) {
      //cek data user pada db lokal
      User lokalUser =
          await repository.validateUserLocal(remoteUser['username']);
      if (lokalUser != null) {
        yield LoginRemoteCompleted(lokalUser);
      } else {
        //simpan data login ke db lokal
        await repository.insertUserLocal(
          UsersCompanion.insert(
            userId: remoteUser['data']['user_id'],
            name: remoteUser['data']['name'],
            username: remoteUser['data']['username'],
            type: remoteUser['data']['type'],
            token: remoteUser['data']['token'],
          ),
        );

        yield LoginRemoteCompleted(
          User(
            userId: remoteUser['data']['user_id'],
            name: remoteUser['data']['name'],
            username: remoteUser['data']['username'],
            type: remoteUser['data']['type'],
            token: remoteUser['data']['token'],
          ),
        );
      }
    } else {
      yield AuthenticateError(
          message:
              "Login gagal, user password salah atau user anda sudah tidak aktif");
    }
  }

  Stream<AuthenticateState> _deleteUserLocal(DeleteUserLocal event) async* {
    await repository.deleteUserByUsername(event.username);
    yield DeleteUserLocalCompleted();
  }

  Stream<AuthenticateState> _deleteAllUserLocal(
      DeleteAllUserLocal event) async* {
    await repository.deleteUsers();
    yield DeleteAllUserLocalCompleted();
  }

  Stream<AuthenticateState> _getUserLocal() async* {
    User user = await repository.getUserLocal();
    yield GetUserLocalCompleted(user);
  }

  Stream<AuthenticateState> _setTruck(SetTruck event) async* {
    yield SetTruckLoading();
    Map response = await repository.setTruk(event.truckId);
    if (response['response']) {
      await repository.setTrukId(event.truckId, response['data']['username']);
      yield SetTruckCompleted();
    } else {
      yield SetTruckError();
    }
  }
}
