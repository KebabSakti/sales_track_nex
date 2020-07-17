part of 'sync_download_bloc.dart';

abstract class SyncState extends Equatable {
  const SyncState();
}

class SyncStateInit extends SyncState {
  const SyncStateInit();

  @override
  List<Object> get props => [];
}

class SyncLoading extends SyncState {
  const SyncLoading();

  @override
  List<Object> get props => [];
}

class SyncProgress extends SyncState {
  final double percentage;

  const SyncProgress(this.percentage);

  @override
  List<Object> get props => [percentage];
}

class DownloadOutletComplete extends SyncState {
  final List<OutletData> outlets;
  final double percentage;

  const DownloadOutletComplete({this.outlets, this.percentage});

  @override
  List<Object> get props => [outlets, percentage];
}

class UploadOutletComplete extends SyncState {
  const UploadOutletComplete();

  @override
  List<Object> get props => [];
}

class FetchOutletComplete extends SyncState {
  final List<OutletData> outlets;
  const FetchOutletComplete({this.outlets});

  @override
  List<Object> get props => [];
}

class InsertOutletComplete extends SyncState {
  final int id;
  const InsertOutletComplete({this.id});

  @override
  List<Object> get props => [id];
}

class UpdateOutletComplete extends SyncState {
  final int id;

  const UpdateOutletComplete({this.id});

  @override
  List<Object> get props => [id];
}

class DeleteOutletComplete extends SyncState {
  final int id;
  const DeleteOutletComplete({this.id});

  @override
  List<Object> get props => [id];
}

class DownloadTrukCompleted extends SyncState {
  final List<TrukData> truks;
  
  const DownloadTrukCompleted({this.truks});

  @override
  List<Object> get props => [];
}

class SyncOutletError extends SyncState {
  final String message;

  const SyncOutletError({this.message});

  @override
  List<Object> get props => [message];
}

class SyncCompleted extends SyncState {
  const SyncCompleted();

  @override
  List<Object> get props => [];
}
