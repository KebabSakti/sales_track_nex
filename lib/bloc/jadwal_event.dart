part of 'jadwal_bloc.dart';

abstract class JadwalEvent extends Equatable {
  const JadwalEvent();
}

class GetJadwal extends JadwalEvent {
  final String date;
  final User user;
  const GetJadwal(this.date, this.user);

  @override
  List<Object> get props => [date];
}
