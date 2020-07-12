part of 'authenticate_bloc.dart';

@immutable
abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();
}

class LoginRemote extends AuthenticateEvent {
  final String username, password;
  const LoginRemote(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class GetLoggedInUser extends AuthenticateEvent {
  const GetLoggedInUser();

  @override
  List<Object> get props => [];
}

class ValidateUserRemote extends AuthenticateEvent {
  final String username;
  const ValidateUserRemote(this.username);

  @override
  List<Object> get props => [username];
}

class ValidateUserLocal extends AuthenticateEvent {
  final String username;
  const ValidateUserLocal(this.username);

  @override
  List<Object> get props => [username];
}

class InsertUserLocal extends AuthenticateEvent {
  final User user;
  const InsertUserLocal(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUserLocal extends AuthenticateEvent {
  final User user;
  const UpdateUserLocal(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUserLocal extends AuthenticateEvent {
  final String username;
  const DeleteUserLocal(this.username);

  @override
  List<Object> get props => [username];
}

class DeleteAllUserLocal extends AuthenticateEvent {
  const DeleteAllUserLocal();

  @override
  List<Object> get props => [];
}
