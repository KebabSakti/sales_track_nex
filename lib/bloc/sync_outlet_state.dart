part of 'sync_outlet_bloc.dart';

abstract class SyncOutletState extends Equatable {
  const SyncOutletState();
}

class SyncOutletInitial extends SyncOutletState {
  const SyncOutletInitial();

  @override
  List<Object> get props => [];
}

class SyncOutletLoading extends SyncOutletState {
  const SyncOutletLoading();

  @override
  List<Object> get props => [];
}

class SyncOutletProgress extends SyncOutletState {
  final double percentage;

  const SyncOutletProgress(this.percentage);

  @override
  List<Object> get props => [percentage];
}

class DownloadOutletComplete extends SyncOutletState {
  final List<OutletData> outlets;
  final double percentage;

  const DownloadOutletComplete({this.outlets, this.percentage});

  @override
  List<Object> get props => [outlets, percentage];
}

class UploadOutletComplete extends SyncOutletState {
  const UploadOutletComplete();

  @override
  List<Object> get props => [];
}

class FetchOutletComplete extends SyncOutletState {
  final List<OutletData> outlets;
  const FetchOutletComplete({this.outlets});

  @override
  List<Object> get props => [];
}

class InsertOutletComplete extends SyncOutletState {
  final int id;
  const InsertOutletComplete({this.id});

  @override
  List<Object> get props => [id];
}

class UpdateOutletComplete extends SyncOutletState {
  final int id;

  const UpdateOutletComplete({this.id});

  @override
  List<Object> get props => [id];
}

class DeleteOutletComplete extends SyncOutletState {
  final int id;
  const DeleteOutletComplete({this.id});

  @override
  List<Object> get props => [id];
}

class SyncOutletError extends SyncOutletState {
  final String message;

  const SyncOutletError({this.message});

  @override
  List<Object> get props => [message];
}
