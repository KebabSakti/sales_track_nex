part of 'list_outlet_bloc.dart';

abstract class ListOutletState extends Equatable {
  const ListOutletState();
}

class ListOutletInitial extends ListOutletState {
  @override
  List<Object> get props => [];
}

class FetchOutletLoading extends ListOutletState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchOutletComplete extends ListOutletState {
  final List<OutletData> outletData;
  const FetchOutletComplete(this.outletData);

  @override
  // TODO: implement props
  List<Object> get props => [outletData];
}

class FetchOutletError extends ListOutletState {
  final String message;
  const FetchOutletError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
