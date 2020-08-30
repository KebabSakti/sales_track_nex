import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'list_order_event.dart';
part 'list_order_state.dart';

class ListOrderBloc extends Bloc<ListOrderEvent, ListOrderState> {
  final Repository repository;

  ListOrderBloc(this.repository) : super(ListOrderInitial());

  @override
  Stream<ListOrderState> mapEventToState(
    ListOrderEvent event,
  ) async* {
    yield FetchOrderLoading();

    if (event is FetchOrder) {
      yield* _fetchOrder(event);
    }
  }

  Stream<ListOrderState> _fetchOrder(FetchOrder event) async* {
    var order = await repository.fetchOrder(event.periodeAwal,
        event.periodeAkhir, event.user.userId, event.keyword);

    if (order.length > 0) {
      yield FetchOrderComplete(order);
    } else {
      yield FetchOrderError();
    }
  }
}
