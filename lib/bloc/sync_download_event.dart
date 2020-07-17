part of 'sync_download_bloc.dart';

abstract class SyncEvent extends Equatable {
  const SyncEvent();
}

class SyncEventInit extends SyncEvent {
  const SyncEventInit();

  @override
  List<Object> get props => [];
}

class DownloadOutlet extends SyncEvent {
  final User user;

  const DownloadOutlet(this.user);

  @override
  List<Object> get props => [user];
}

class UploadOutlet extends SyncEvent {
  final OutletData outlet;

  const UploadOutlet(this.outlet);

  @override
  List<Object> get props => [outlet];
}

class FetchOutlet extends SyncEvent {
  final String keyword;

  const FetchOutlet(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class InsertOutlet extends SyncEvent {
  final OutletData outlet;

  const InsertOutlet(this.outlet);

  @override
  List<Object> get props => [outlet];
}

class UpdateOutlet extends SyncEvent {
  final String barcode;
  final OutletData outlet;

  const UpdateOutlet(this.barcode, this.outlet);

  @override
  List<Object> get props => [barcode, outlet];
}

class DeleteOutlet extends SyncEvent {
  final String barcode;
  final OutletData outlet;

  const DeleteOutlet(this.barcode, this.outlet);

  @override
  List<Object> get props => [outlet];
}

class DeleteAllOutlet extends SyncEvent {
  const DeleteAllOutlet();

  @override
  List<Object> get props => [];
}
