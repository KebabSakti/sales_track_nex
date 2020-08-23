part of 'authenticate_bloc.dart';

@immutable
abstract class AuthenticateState extends Equatable {
  const AuthenticateState(this.user);
  final User user;
}

class AuthenticateInitial extends AuthenticateState {
  const AuthenticateInitial() : super(null);

  @override
  List<Object> get props => [];
}

class AuthenticateLoading extends AuthenticateState {
  final String message;
  const AuthenticateLoading({this.message}) : super(null);

  @override
  List<Object> get props => [message];
}

class LoginRemoteCompleted extends AuthenticateState {
  final User user;
  const LoginRemoteCompleted(this.user) : super(user);

  @override
  List<Object> get props => [user];
}

class GetLoggedInUserCompleted extends AuthenticateState {
  final User user;
  const GetLoggedInUserCompleted(this.user) : super(user);

  @override
  List<Object> get props => [user];
}

class ValidateUserRemoteCompleted extends AuthenticateState {
  final User user;
  const ValidateUserRemoteCompleted(this.user) : super(null);

  @override
  List<Object> get props => [user];
}

class ValidateUserLocalCompleted extends AuthenticateState {
  final User user;
  const ValidateUserLocalCompleted(this.user) : super(null);

  @override
  List<Object> get props => [user];
}

class InsertUserLocalCompleted extends AuthenticateState {
  final User user;
  const InsertUserLocalCompleted(this.user) : super(null);

  @override
  List<Object> get props => [user];
}

class UpdateUserLocalCompleted extends AuthenticateState {
  final User user;
  const UpdateUserLocalCompleted(this.user) : super(null);

  @override
  List<Object> get props => [];
}

class DeleteUserLocalCompleted extends AuthenticateState {
  const DeleteUserLocalCompleted() : super(null);

  @override
  List<Object> get props => [];
}

class DeleteAllUserLocalCompleted extends AuthenticateState {
  const DeleteAllUserLocalCompleted() : super(null);

  @override
  List<Object> get props => [];
}

class AuthenticateError extends AuthenticateState {
  final String message;
  const AuthenticateError({this.message}) : super(null);

  @override
  List<Object> get props => [message];
}

class GetUserLocalCompleted extends AuthenticateState {
  final User user;

  const GetUserLocalCompleted(this.user) : super(user);

  @override
  List<Object> get props => [user];
}

class SetTruckLoading extends AuthenticateState {
  const SetTruckLoading() : super(null);

  @override
  List<Object> get props => [];
}

class SetTruckCompleted extends AuthenticateState {
  const SetTruckCompleted() : super(null);

  @override
  List<Object> get props => [];
}

class SetTruckError extends AuthenticateState {
  final String message;

  const SetTruckError({this.message}) : super(null);

  @override
  List<Object> get props => [message];
}
