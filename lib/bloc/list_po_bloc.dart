import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'list_po_event.dart';
part 'list_po_state.dart';

class ListPoBloc extends Bloc<ListPoEvent, ListPoState> {
  final Repository repository;

  ListPoBloc(this.repository) : super(ListPoInitial());

  @override
  Stream<ListPoState> mapEventToState(
    ListPoEvent event,
  ) async* {
    yield FetchPoLoading();

    if (event is FetchPo) {
      yield* _fetchPo(event);
    }
  }

  Stream<ListPoState> _fetchPo(FetchPo event) async* {
    var orderPo = await repository.fetchOrder(event.periodeAwal,
        event.periodeAkhir, event.user.userId, event.keyword);

    if (orderPo.length > 0) {
      yield FetchPoComplete(orderPo);
    } else {
      yield FetchPoError();
    }
  }
}
