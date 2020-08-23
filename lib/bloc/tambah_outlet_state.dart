part of 'tambah_outlet_bloc.dart';

abstract class TambahOutletState extends Equatable {
  const TambahOutletState();
}

class TambahOutletInitial extends TambahOutletState {
  const TambahOutletInitial();

  @override
  List<Object> get props => [];
}

class ScanBarcodeLoading extends TambahOutletState {
  final String message;
  const ScanBarcodeLoading({this.message});

  @override
  List<Object> get props => [];
}

class ProcessLoadingStatus extends TambahOutletState {
  const ProcessLoadingStatus(this.status);

  final bool status;

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class ScanBarcodeCompleted extends TambahOutletState {
  final ScanResult scanResult;
  final LocationData locationData;
  const ScanBarcodeCompleted({this.scanResult, this.locationData});

  @override
  List<Object> get props => [scanResult, locationData];
}

class ScanBarcodeError extends TambahOutletState {
  final String message;
  const ScanBarcodeError({this.message});

  @override
  List<Object> get props => [message];
}

class ValidateOutletLoading extends TambahOutletState {
  const ValidateOutletLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ValidateOutletComplete extends TambahOutletState {
  const ValidateOutletComplete();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ValidateOutletError extends TambahOutletState {
  const ValidateOutletError({this.message});
  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class InsertNewOutletLoading extends TambahOutletState {
  final String message;
  const InsertNewOutletLoading({this.message});

  @override
  List<Object> get props => [message];
}

class InsertNewOutletComplete extends TambahOutletState {
  final OutletData outletData;
  const InsertNewOutletComplete({this.outletData});

  @override
  List<Object> get props => [outletData];
}

class InsertNewOutletError extends TambahOutletState {
  final String message;
  const InsertNewOutletError({this.message});

  @override
  List<Object> get props => [message];
}
