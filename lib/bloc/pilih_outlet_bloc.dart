import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'pilih_outlet_event.dart';
part 'pilih_outlet_state.dart';

class PilihOutletBloc extends Bloc<PilihOutletEvent, PilihOutletState> {
  final Repository repository;

  PilihOutletBloc(this.repository) : super(PilihOutletInitial());

  @override
  Stream<PilihOutletState> mapEventToState(
    PilihOutletEvent event,
  ) async* {
    yield FetchOutletLoading();

    if (event is FetchOutlet) {
      yield* _fetchOutlet(event);
    } else if (event is GetLocationData) {
      yield* _getLocationData(event);
    }
  }

  Stream<PilihOutletState> _fetchOutlet(FetchOutlet event) async* {
    List<OutletData> outletData =
        await repository.getOutletByKeyword(event.keyword, event.user.username);

    if (outletData.length > 0)
      yield FetchOutletComplete(outletData);
    else
      yield FetchOutletError(message: 'Data tidak ditemukan');
  }

  Stream<PilihOutletState> _getLocationData(GetLocationData event) async* {
    var locationData = await repository.getSingleLocation();

    yield GetLocationDataComplete(locationData);
  }
}
