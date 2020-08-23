part of 'order_product_bloc.dart';

abstract class OrderProductState extends Equatable {
  const OrderProductState();
}

class OrderProductInitial extends OrderProductState {
  @override
  List<Object> get props => [];
}

class GetOrderProductLoading extends OrderProductState {
  const GetOrderProductLoading();

  @override
  List<Object> get props => [];
}

class GetOrderProductComplete extends OrderProductState {
  final List<ProdukData> product;
  const GetOrderProductComplete({@required this.product});

  @override
  List<Object> get props => [product];
}

class ToggleProductSearchComplete extends OrderProductState {
  final bool status;
  const ToggleProductSearchComplete(this.status);

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class GetOrderProductError extends OrderProductState {
  final String message;
  const GetOrderProductError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
