part of 'keranjang_bloc.dart';

abstract class KeranjangState extends Equatable {
  const KeranjangState(this.keranjangDetail);

  final KeranjangDetail keranjangDetail;
}

class KeranjangInitial extends KeranjangState {
  KeranjangInitial(KeranjangDetail keranjangDetail) : super(keranjangDetail);

  @override
  List<Object> get props => [];
}

class KeranjangStatus extends KeranjangState {
  const KeranjangStatus(this.keranjangDetail) : super(keranjangDetail);

  final KeranjangDetail keranjangDetail;

  @override
  // TODO: implement props
  List<Object> get props => [keranjangDetail];
}

class SetPembayaranComplete extends KeranjangState {
  final KeranjangDetail keranjangDetail;

  const SetPembayaranComplete(this.keranjangDetail) : super(keranjangDetail);

  @override
  // TODO: implement props
  List<Object> get props => [keranjangDetail];
}

class SubmitVisitLoading extends KeranjangState {
  const SubmitVisitLoading(KeranjangDetail keranjangDetail)
      : super(keranjangDetail);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ResetKeranjangComplete extends KeranjangState {
  const ResetKeranjangComplete(KeranjangDetail keranjangDetail)
      : super(keranjangDetail);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SetNomorPoComplete extends KeranjangState {
  const SetNomorPoComplete(KeranjangDetail keranjangDetail)
      : super(keranjangDetail);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
