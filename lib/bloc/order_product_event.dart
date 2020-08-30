part of 'order_product_bloc.dart';

abstract class OrderProductEvent extends Equatable {
  const OrderProductEvent();
}

class GetOrderProduct extends OrderProductEvent {
  final String keyword;
  final int limit;
  final int offset;
  final User user;

  const GetOrderProduct(this.keyword, this.user, {this.limit, this.offset});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ToggleProductSearch extends OrderProductEvent {
  final bool status;
  const ToggleProductSearch(this.status);

  @override
  // TODO: implement props
  List<Object> get props => [status];
}
