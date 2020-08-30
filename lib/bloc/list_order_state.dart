part of 'list_order_bloc.dart';

abstract class ListOrderState extends Equatable {
  const ListOrderState();
}

class ListOrderInitial extends ListOrderState {
  @override
  List<Object> get props => [];
}

class FetchOrderLoading extends ListOrderState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchOrderComplete extends ListOrderState {
  final List<OrderWithOutlet> order;

  const FetchOrderComplete(this.order);

  @override
  // TODO: implement props
  List<Object> get props => [order];
}

class FetchOrderError extends ListOrderState {
  final String message;

  const FetchOrderError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
