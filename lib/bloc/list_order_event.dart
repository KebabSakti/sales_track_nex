part of 'list_order_bloc.dart';

abstract class ListOrderEvent extends Equatable {
  const ListOrderEvent();
}

class FetchOrder extends ListOrderEvent {
  final String periodeAwal, periodeAkhir, keyword;
  final User user;
  const FetchOrder(
      this.periodeAwal, this.periodeAkhir, this.user, this.keyword);

  @override
  // TODO: implement props
  List<Object> get props => [periodeAwal, periodeAkhir, user, keyword];
}
