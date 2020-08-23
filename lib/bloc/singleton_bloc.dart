import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'singleton_event.dart';
part 'singleton_state.dart';

class SingletonBloc extends Bloc<SingletonEvent, SingletonState> {
  SingletonBloc(this.repository) : super(SingletonInitial(repository));

  final Repository repository;

  @override
  Stream<SingletonState> mapEventToState(
    SingletonEvent event,
  ) async* {}
}
