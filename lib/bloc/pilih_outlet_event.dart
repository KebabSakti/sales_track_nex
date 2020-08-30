part of 'pilih_outlet_bloc.dart';

abstract class PilihOutletEvent extends Equatable {
  const PilihOutletEvent();
}

class FetchOutlet extends PilihOutletEvent {
  final String keyword;
  final User user;
  const FetchOutlet(this.keyword, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [keyword];
}

class GetLocationData extends PilihOutletEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
