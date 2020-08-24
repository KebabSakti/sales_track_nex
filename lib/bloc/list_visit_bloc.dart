import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'list_visit_event.dart';
part 'list_visit_state.dart';

class ListVisitBloc extends Bloc<ListVisitEvent, ListVisitState> {
  final Repository repository;

  ListVisitBloc(this.repository) : super(ListVisitInitial());

  @override
  Stream<ListVisitState> mapEventToState(
    ListVisitEvent event,
  ) async* {
    yield GetDataVisitLoading(state.visitWithOutlet);

    if (event is GetDataVisit) {
      yield* _getDataVisit(event);
    }
  }

  Stream<ListVisitState> _getDataVisit(GetDataVisit event) async* {
    var visitWithOutlet = await repository.getVisitWithOutlet(
      event.userId,
      event.keyword,
      event.periodeAwal,
      event.periodeAkhir,
    );

    if (visitWithOutlet.length > 0)
      yield GetDataVisitComplete(visitWithOutlet);
    else
      yield GetDataVisitError();
  }
}
