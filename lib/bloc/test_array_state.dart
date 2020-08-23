part of 'test_array_bloc.dart';

abstract class TestArrayState extends Equatable {
  final List<String> list;
  const TestArrayState(this.list);

  @override
  List<Object> get props => [list];
}

class TestArrayInitial extends TestArrayState {
  const TestArrayInitial(List<String> list) : super(list);
}

class SetListComplete extends TestArrayState {
  final List<String> list;
  const SetListComplete(this.list) : super(list);
}
