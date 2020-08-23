part of 'jadwal_bloc.dart';

abstract class JadwalEvent extends Equatable {
  const JadwalEvent();
}

class GetJadwal extends JadwalEvent {
  const GetJadwal();

  @override
  List<Object> get props => [];
}
