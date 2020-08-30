part of 'jadwal_bloc.dart';

abstract class JadwalState extends Equatable {
  const JadwalState();
}

class JadwalInitial extends JadwalState {
  @override
  List<Object> get props => [];
}

class GetJadwalLoading extends JadwalState {
  const GetJadwalLoading();

  @override
  List<Object> get props => [];
}

class GetJadwalCompleted extends JadwalState {
  final List<JadwalWithOutlet> jadwalWithOutlet;
  const GetJadwalCompleted(this.jadwalWithOutlet);

  @override
  List<Object> get props => [jadwalWithOutlet];
}

class GetJadwalWithOutletCompleted extends JadwalState {
  final List<JadwalRangeData> jadwalRangeData;

  const GetJadwalWithOutletCompleted(this.jadwalRangeData);

  @override
  List<Object> get props => [jadwalRangeData];
}

class GetJadwalError extends JadwalState {
  final String message;

  const GetJadwalError({this.message});

  @override
  List<Object> get props => [message];
}
