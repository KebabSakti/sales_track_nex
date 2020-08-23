part of 'sync_bloc.dart';

abstract class SyncState extends Equatable {
  const SyncState();
}

class SyncInitial extends SyncState {
  const SyncInitial();

  @override
  List<Object> get props => [];
}

class SyncLoading extends SyncState {
  final String message;
  final data;

  const SyncLoading({this.message, this.data});

  @override
  List<Object> get props => [message, data];
}

class SyncCompleted extends SyncState {
  final data;

  const SyncCompleted({this.data});

  @override
  List<Object> get props => [data];
}

class SyncFailed extends SyncState {
  final String message;
  final data;

  const SyncFailed({this.message, this.data});

  @override
  List<Object> get props => [message, data];
}

class ShouldSyncResponse extends SyncState {
  final bool response;
  const ShouldSyncResponse(this.response);

  @override
  List<Object> get props => [];
}
