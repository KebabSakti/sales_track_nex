part of 'tambah_outlet_bloc.dart';

abstract class TambahOutletEvent extends Equatable {
  const TambahOutletEvent();
}

class ScanBarcode extends TambahOutletEvent {
  const ScanBarcode();

  @override
  List<Object> get props => [];
}

class ProcessLoading extends TambahOutletEvent {
  const ProcessLoading(this.status);

  final bool status;

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class ValidateOutlet extends TambahOutletEvent {
  const ValidateOutlet({@required this.qr});

  final String qr;

  @override
  // TODO: implement props
  List<Object> get props => [qr];
}

class InsertNewOutlet extends TambahOutletEvent {
  final String barcode, lat, lng, namaOutlet, owner, telp, alamat;

  const InsertNewOutlet({
    @required this.barcode,
    @required this.lat,
    @required this.lng,
    @required this.namaOutlet,
    this.owner,
    this.telp,
    this.alamat,
  });

  @override
  List<Object> get props =>
      [barcode, lat, lng, namaOutlet, owner, telp, alamat];
}
