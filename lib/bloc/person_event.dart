part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class SetTestModel extends PersonEvent {
  final TestModel testModel;
  const SetTestModel({this.testModel});

  @override
  // TODO: implement props
  List<Object> get props => [testModel];
}

class ResetPerson extends PersonEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResetSyncInfo extends PersonEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
