part of 'sync_bloc.dart';

abstract class SyncEvent extends Equatable {
  const SyncEvent();
}

class Sync extends SyncEvent {
  const Sync();

  @override
  List<Object> get props => [];
}