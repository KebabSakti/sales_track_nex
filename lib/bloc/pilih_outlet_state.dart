part of 'pilih_outlet_bloc.dart';

abstract class PilihOutletState extends Equatable {
  const PilihOutletState();
}

class PilihOutletInitial extends PilihOutletState {
  @override
  List<Object> get props => [];
}

class FetchOutletLoading extends PilihOutletState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchOutletComplete extends PilihOutletState {
  final List<OutletData> outletData;
  const FetchOutletComplete(this.outletData);

  @override
  // TODO: implement props
  List<Object> get props => [outletData];
}

class FetchOutletError extends PilihOutletState {
  final String message;
  const FetchOutletError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class GetLocationDataComplete extends PilihOutletState {
  final LocationData locationData;
  const GetLocationDataComplete(this.locationData);

  @override
  // TODO: implement props
  List<Object> get props => [locationData];
}
