import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';

part 'singleton_event.dart';
part 'singleton_state.dart';

class SingletonBloc extends Bloc<SingletonEvent, SingletonState> {
  final NexDatabase database;
  final Dio dio;

  SingletonBloc(this.database, this.dio) : super(null);

  @override
  Stream<SingletonState> mapEventToState(
    SingletonEvent event,
  ) async* {}
}
