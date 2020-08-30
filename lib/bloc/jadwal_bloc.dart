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
      yield* _getJadwal(event);
    }
  }

  Stream<JadwalState> _getJadwal(GetJadwal event) async* {
    var jadwalWithOutlet =
        await repository.getJadwalWithOutlet(event.user.userId, event.date);

    if (jadwalWithOutlet.length > 0) {
      yield GetJadwalCompleted(jadwalWithOutlet);
    } else {
      yield GetJadwalError(message: 'Tidak ada data');
    }
  }
}
