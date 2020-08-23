part of 'keranjang_bloc.dart';

abstract class KeranjangEvent extends Equatable {
  const KeranjangEvent();
}

class AddItem extends KeranjangEvent {
  const AddItem(this.keranjangData);

  final KeranjangData keranjangData;

  @override
  // TODO: implement props
  List<Object> get props => [keranjangData];
}

class SetPembayaran extends KeranjangEvent {
  final String pembayaran;

  const SetPembayaran(this.pembayaran);

  @override
  // TODO: implement props
  List<Object> get props => [pembayaran];
}

class SetNomorPo extends KeranjangEvent {
  const SetNomorPo();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Resetkeranjang extends KeranjangEvent {
  const Resetkeranjang();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
