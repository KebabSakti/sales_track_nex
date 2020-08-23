import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/jadwal_with_range.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'jadwal_event.dart';
part 'jadwal_state.dart';

class JadwalBloc extends Bloc<JadwalEvent, JadwalState> {
  JadwalBloc(this.repository) : super(JadwalInitial());

  final Repository repository;

  @override
  Stream<JadwalState> mapEventToState(
    JadwalEvent event,
  ) async* {
    yield GetJadwalLoading();

    if (event is GetJadwal) {
      List<JadwalRangeData> jadwalRangeData = [];

      User user = await repository.getLoggedInUser();
      List<JadwalWithOutlet> jadwalWithOutlet =
          await repository.getJadwalWithOutlet(user.userId, DateTime.now());

      for (var item in jadwalWithOutlet) {
//        Map response = await repository.getJadwalWithRange('-0.454551',
//            '117.143850', item.outletData.lat, item.outletData.lng);
//
//        print(response);
//
//        var jarak = response['routes'].length > 0
//            ? (response['routes'][0]['sections'][0]['summary']['length'] / 1000)
//                .toString()
//            : '0';
        if (item != null)
          jadwalRangeData.add(
            JadwalRangeData(
              outletId: item.outletData.outletId,
              namaOutlet: item.outletData.outletName,
              lat: item.outletData.lat,
              lng: item.outletData.lng,
              keterangan: '',
              jarak: '',
              visit: item.jadwalData.visit,
            ),
          );
      }

      if (jadwalRangeData.length > 0) {
        yield GetJadwalWithOutletCompleted(jadwalRangeData);
      } else {
        yield GetJadwalError();
      }
    }
  }
}
