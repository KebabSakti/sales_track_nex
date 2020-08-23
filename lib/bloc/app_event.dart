part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class GetUserLocal extends AppEvent {
  const GetUserLocal();

  @override
  List<Object> get props => [];
}
