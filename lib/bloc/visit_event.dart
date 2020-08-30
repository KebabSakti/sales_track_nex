part of 'visit_bloc.dart';

abstract class VisitEvent extends Equatable {
  const VisitEvent();
}

class ScanBarcode extends VisitEvent {
  const ScanBarcode();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ValidateOutlet extends VisitEvent {
  const ValidateOutlet({
    @required this.scanResult,
    @required this.locationData,
    @required this.user,
  });

  final String scanResult;
  final LocationData locationData;
  final User user;

  @override
  // TODO: implement props
  List<Object> get props => [scanResult];
}

class VisitFoto extends VisitEvent {
  const VisitFoto(this.foto);

  final List<String> foto;

  @override
  // TODO: implement props
  List<Object> get props => [foto];
}

class SubmitVisit extends VisitEvent {
  final OutletData outletData;
  final LocationData locationData;
  final List<String> foto;
  final KeranjangDetail keranjangDetail;
  final User user;
  final int tutup;

  const SubmitVisit({
    @required this.outletData,
    @required this.locationData,
    @required this.foto,
    @required this.user,
    @required this.tutup,
    this.keranjangDetail,
  });

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ResetVisitData extends VisitEvent {
  const ResetVisitData();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
