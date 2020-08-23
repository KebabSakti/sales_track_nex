import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pre_order_event.dart';
part 'pre_order_state.dart';

class PreOrderBloc extends Bloc<PreOrderEvent, PreOrderState> {
  PreOrderBloc() : super(PreOrderInitial());

  @override
  Stream<PreOrderState> mapEventToState(
    PreOrderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
