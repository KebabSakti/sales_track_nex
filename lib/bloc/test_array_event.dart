part of 'test_array_bloc.dart';

abstract class TestArrayEvent extends Equatable {
  const TestArrayEvent();
}

class SetList extends TestArrayEvent {
  final String foto;

  const SetList(this.foto);

  @override
  // TODO: implement props
  List<Object> get props => [foto];
}
