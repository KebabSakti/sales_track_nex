part of 'detail_order_bloc.dart';

abstract class DetailOrderEvent extends Equatable {
  const DetailOrderEvent();
}

class GetOrderItemData extends DetailOrderEvent {
  final OrderWithOutlet orderWithOutlet;
  final BuildContext context;

  const GetOrderItemData(this.orderWithOutlet, this.context);

  @override
  // TODO: implement props
  List<Object> get props => [orderWithOutlet];
}

class SubmitFaktur extends DetailOrderEvent {
  final KeranjangDetail keranjangDetail;
  final OrderData orderData;
  final BuildContext context;
  final User user;

  const SubmitFaktur(
      this.keranjangDetail, this.orderData, this.context, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [keranjangDetail, orderData];
}
