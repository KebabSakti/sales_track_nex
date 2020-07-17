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
    }
  }

  Stream<AuthenticateState> _getLoggedInUser(GetLoggedInUser event) async* {
    yield AuthenticateLoading(message: "otentikasi user");
    //cek user pada db lokal
    var localUser = await repository.getLoggedInUser();
    if (localUser != null) {
      //validasi user remote
      var remoteUser = await repository.validateUserRemote(localUser.username);
      if (remoteUser != null) {
        //update data user lokal
        await repository.updateUserLocal(remoteUser);
        yield GetLoggedInUserCompleted(remoteUser);
      }
    } else {
      yield AuthenticateError();
    }
  }

  Stream<AuthenticateState> _loginRemote(LoginRemote event) async* {
    var remoteUser =
        await repository.loginRemote(event.username, event.password);
    if (remoteUser != null) {
      //cek data user pada db lokal
      var lokalUser = await repository.validateUserLocal(remoteUser.username);
      if (lokalUser != null) {
        yield LoginRemoteCompleted(lokalUser);
      } else {
        //simpan data login ke db lokal
        await repository.insertUserLocal(remoteUser);
        yield LoginRemoteCompleted(remoteUser);
      }
    } else {
      yield AuthenticateError(
          message:
              "Login gagal, user password salah atau user anda sudah tidak aktif");
    }
  }

  Stream<AuthenticateState> _deleteUserLocal(DeleteUserLocal event) async* {
    var deleted = await repository.deleteUserByUsername(event.username);
    if (deleted > 0)
      yield DeleteUserLocalCompleted();
    else
      yield AuthenticateError(
          message: "Terjadi kesalahan, harap coba beberapa saat lagi");
  }

  Stream<AuthenticateState> _deleteAllUserLocal(
      DeleteAllUserLocal event) async* {
    var deleted = await repository.deleteUsers();
    if (deleted > 0)
      yield DeleteAllUserLocalCompleted();
    else
      yield AuthenticateError(
          message: "Terjadi kesalahan, harap coba beberapa saat lagi");
  }
}
