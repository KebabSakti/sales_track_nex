import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/model/test_model.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
//  static const TestModel testModel =
//      TestModel(person: Person(firstName: 'Kebab', lastName: 'Sakti'));

  PersonBloc(this.repository) : super(PersonInitial(null));

  final Repository repository;

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is SetTestModel) {
      yield* _setTestModel(event);
    } else if (event is ResetPerson) {
      yield PersonInitial(null);
    } else if (event is ResetSyncInfo) {
      await repository.deleteSyncInfo();
      print('SYNC RESET');
    }
  }

  Stream<PersonState> _setTestModel(SetTestModel event) async* {
    yield SetTestModelComplete(testModel: event.testModel);
  }
}
