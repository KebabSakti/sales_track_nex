import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'list_outlet_event.dart';
part 'list_outlet_state.dart';

class ListOutletBloc extends Bloc<ListOutletEvent, ListOutletState> {
  final Repository repository;

  ListOutletBloc(this.repository) : super(ListOutletInitial());

  @override
  Stream<ListOutletState> mapEventToState(
    ListOutletEvent event,
  ) async* {
    yield FetchOutletLoading();

    if (event is FetchOutlet) {
      yield* _fetchOutlet(event);
    }
  }

  Stream<ListOutletState> _fetchOutlet(FetchOutlet event) async* {
    var outletData =
        await repository.getOutletByKeyword(event.keyword, event.user.username);

    if (outletData.length > 0)
      yield FetchOutletComplete(outletData);
    else
      yield FetchOutletError(message: 'Data tidak ada');
  }
}
