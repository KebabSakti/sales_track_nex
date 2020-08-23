import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc(this.repository) : super(ScannerInitial(null, null));

  final Repository repository;

  @override
  Stream<ScannerState> mapEventToState(
    ScannerEvent event,
  ) async* {
    yield ScanQRLoading();

    if (event is ScanQR) yield* _scanQR(event);
  }

  Stream<ScannerState> _scanQR(ScannerEvent event) async* {
    ScanResult scanResult = await repository.scanBarcode();
    LocationData locationData = await repository.getSingleLocation();

    if (scanResult.rawContent != '' && locationData != null)
      yield ScanQRCompleted(scanResult: scanResult, locationData: locationData);
    else
      yield ScanQRError();
  }
}
