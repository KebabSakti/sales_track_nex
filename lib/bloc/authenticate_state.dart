part of 'authenticate_bloc.dart';

@immutable
abstract class AuthenticateState extends Equatable {
  const AuthenticateState();
}

class AuthenticateInitial extends AuthenticateState {
  const AuthenticateInitial();

  @override
  List<Object> get props => [];
}

class AuthenticateLoading extends AuthenticateState {
  const AuthenticateLoading();

  @override
  List<Object> get props => [];
}

class LoginRemoteCompleted extends AuthenticateState {
  final User user;
  const LoginRemoteCompleted(this.user);

  @override
  List<Object> get props => [user];
}

class GetLoggedInUserCompleted extends AuthenticateState {
  final User user;
  const GetLoggedInUserCompleted(this.user);

  @override
  List<Object> get props => [user];
}

class ValidateUserRemoteCompleted extends AuthenticateState {
  final User user;
  const ValidateUserRemoteCompleted(this.user);

  @override
  List<Object> get props => [user];
}

class ValidateUserLocalCompleted extends AuthenticateState {
  final User user;
  const ValidateUserLocalCompleted(this.user);

  @override
  List<Object> get props => [user];
}

class InsertUserLocalCompleted extends AuthenticateState {
  final User user;
  const InsertUserLocalCompleted(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUserLocalCompleted extends AuthenticateState {
  final User user;
  const UpdateUserLocalCompleted(this.user);

  @override
  List<Object> get props => [];
}

class DeleteUserLocalCompleted extends AuthenticateState {
  const DeleteUserLocalCompleted();

  @override
  List<Object> get props => [];
}

class DeleteAllUserLocalCompleted extends AuthenticateState {
  const DeleteAllUserLocalCompleted();

  @override
  List<Object> get props => [];
}

class AuthenticateError extends AuthenticateState {
  final String message;
  const AuthenticateError(this.message);

  @override
  List<Object> get props => [message];
}
