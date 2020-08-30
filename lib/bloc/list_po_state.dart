part of 'list_po_bloc.dart';

abstract class ListPoState extends Equatable {
  const ListPoState();
}

class ListPoInitial extends ListPoState {
  @override
  List<Object> get props => [];
}

class FetchPoLoading extends ListPoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchPoComplete extends ListPoState {
  final List<OrderWithOutlet> orderPo;

  const FetchPoComplete(this.orderPo);

  @override
  // TODO: implement props
  List<Object> get props => [orderPo];
}

class FetchPoError extends ListPoState {
  final String message;

  const FetchPoError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
