part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  final TestModel testModel;
  const PersonState(this.testModel);
}

class PersonInitial extends PersonState {
  PersonInitial(TestModel testModel) : super(testModel);

  @override
  List<Object> get props => [];
}

class SetTestModelComplete extends PersonState {
  final TestModel testModel;
  const SetTestModelComplete({this.testModel}) : super(testModel);

  @override
  // TODO: implement props
  List<Object> get props => [testModel];
}
