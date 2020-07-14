part of 'sync_outlet_bloc.dart';

abstract class SyncOutletEvent extends Equatable {
  const SyncOutletEvent();
}

class SyncOutletInit extends SyncOutletEvent {
  const SyncOutletInit();

  @override
  List<Object> get props => [];
}

class DownloadOutlet extends SyncOutletEvent {
  final User user;

  const DownloadOutlet(this.user);

  @override
  List<Object> get props => [user];
}

class UploadOutlet extends SyncOutletEvent {
  final OutletData outlet;

  const UploadOutlet(this.outlet);

  @override
  List<Object> get props => [outlet];
}

class FetchOutlet extends SyncOutletEvent {
  final String keyword;

  const FetchOutlet(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class InsertOutlet extends SyncOutletEvent {
  final OutletData outlet;

  const InsertOutlet(this.outlet);

  @override
  List<Object> get props => [outlet];
}

class UpdateOutlet extends SyncOutletEvent {
  final String barcode;
  final OutletData outlet;

  const UpdateOutlet(this.barcode, this.outlet);

  @override
  List<Object> get props => [barcode, outlet];
}

class DeleteOutlet extends SyncOutletEvent {
  final String barcode;
  final OutletData outlet;

  const DeleteOutlet(this.barcode, this.outlet);

  @override
  List<Object> get props => [outlet];
}

class DeleteAllOutlet extends SyncOutletEvent {
  const DeleteAllOutlet();

  @override
  List<Object> get props => [];
}
