import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_array_event.dart';
part 'test_array_state.dart';

class TestArrayBloc extends Bloc<TestArrayEvent, TestArrayState> {
  TestArrayBloc() : super(TestArrayInitial([]));

  @override
  Stream<TestArrayState> mapEventToState(
    TestArrayEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is SetList) yield* _setList(event);
  }

  Stream<TestArrayState> _setList(SetList event) async* {
    List<String> newList = [];

    for (var item in state.list) newList.add(item);
    newList.add(event.foto);

    print('State ${state.list.length}');
    print('Not State ${newList.length}');

    yield SetListComplete(newList);
  }
}
