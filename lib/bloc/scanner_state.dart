part of 'scanner_bloc.dart';

abstract class ScannerState extends Equatable {
  const ScannerState(this.scanResult, this.locationData);
  final ScanResult scanResult;
  final LocationData locationData;
}

class ScannerInitial extends ScannerState {
  ScannerInitial(ScanResult scanResult, LocationData locationData)
      : super(null, null);

  @override
  List<Object> get props => [];
}

class ScanQRLoading extends ScannerState {
  ScanQRLoading() : super(null, null);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ScanQRCompleted extends ScannerState {
  const ScanQRCompleted(
      {@required this.scanResult, @required this.locationData})
      : super(scanResult, locationData);

  final ScanResult scanResult;
  final LocationData locationData;

  @override
  // TODO: implement props
  List<Object> get props => [scanResult, locationData];
}

class ScanQRError extends ScannerState {
  const ScanQRError({this.message}) : super(null, null);

  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class LocationError extends ScannerState {
  const LocationError({this.message}) : super(null, null);

  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
