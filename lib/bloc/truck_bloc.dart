import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'truck_event.dart';
part 'truck_state.dart';

class TruckBloc extends Bloc<TruckEvent, TruckState> {
  final Repository repository;

  TruckBloc(this.repository) : super(TruckInitial());

  @override
  Stream<TruckState> mapEventToState(
    TruckEvent event,
  ) async* {
    yield GetTrucksLoading(message: 'fetching trucks data');

    if (event is GetTrucksWithStokSum) {
      //fetch truck data from local database
      List<TrukWithStokSum> trucksWithStokSum =
          await repository.getTrukWithStokSum();

      if (trucksWithStokSum.length > 0)
        yield GetTrucksWithStockSumCompleted(trucksWithStokSum);
      else
        yield GetTrucksError();
    }
  }
}
