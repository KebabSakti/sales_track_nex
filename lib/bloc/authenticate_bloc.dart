import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/authenticate_repository.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final AuthenticateRepository repository;
  
  AuthenticateBloc(this.repository) : super(null);

  @override
  Stream<AuthenticateState> mapEventToState(
    AuthenticateEvent event,
  ) async* {
    yield AuthenticateLoading();

    if (event is GetLoggedInUser) {
      yield* _getLoggedInUser(event);
    } else if (event is LoginRemote) {
      yield* _loginRemote(event);
    } else if (event is ValidateUserLocal) {
      yield* _validateUserLocal(event);
    } else if (event is ValidateUserRemote) {
      yield* _validateUserRemote(event);
    } else if (event is DeleteUserLocal) {
      yield* _deleteUserLocal(event);
    } else if (event is DeleteAllUserLocal) {
      yield* _deleteAllUserLocal(event);
    }
  }

  Stream<AuthenticateState> _getLoggedInUser(GetLoggedInUser event) async* {
    var user = await repository.getLoggedInUser();
    if (user != null)
      yield GetLoggedInUserCompleted(user);
    else
      yield AuthenticateError("");
  }

  Stream<AuthenticateState> _loginRemote(LoginRemote event) async* {
    var user = await repository.loginRemote(event.username, event.password);
    if (user != null) {
      var localUser = await repository.validateUserLocal(user.username);
      if (localUser == null) {
        //simpan data user ke db lokal
        await repository.insertUserLocal(user);
      }
      yield LoginRemoteCompleted(user);
    } else {
      yield AuthenticateError(
          "Login gagal, user password salah atau user anda sudah tidak aktif");
    }
  }

  Stream<AuthenticateState> _validateUserLocal(ValidateUserLocal event) async* {
    var user = await repository.validateUserLocal(event.username);
    if (user != null)
      yield ValidateUserLocalCompleted(user);
    else
      yield AuthenticateError(
          "Login gagal, anda tidak dapat login pada device ini");
  }

  Stream<AuthenticateState> _validateUserRemote(
      ValidateUserRemote event) async* {
    var user = await repository.validateUserRemote(event.username);
    if (user != null) {
      //update info user di db lokal
      await repository.updateUserLocal(user);
      yield ValidateUserRemoteCompleted(user);
    } else {
      yield AuthenticateError(
          "Akun anda sudah di non aktifkan, hubungi supervisor anda untuk mengaktifkan kembali");
    }
  }

  Stream<AuthenticateState> _deleteUserLocal(DeleteUserLocal event) async* {
    var deleted = await repository.deleteUserByUsername(event.username);
    if (deleted > 0)
      yield DeleteUserLocalCompleted();
    else
      yield AuthenticateError(
          "Terjadi kesalahan, harap coba beberapa saat lagi");
  }

  Stream<AuthenticateState> _deleteAllUserLocal(
      DeleteAllUserLocal event) async* {
    var deleted = await repository.deleteUsers();
    if (deleted > 0)
      yield DeleteAllUserLocalCompleted();
    else
      yield AuthenticateError(
          "Terjadi kesalahan, harap coba beberapa saat lagi");
  }
}
