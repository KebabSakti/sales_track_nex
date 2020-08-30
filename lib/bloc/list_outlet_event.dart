part of 'list_outlet_bloc.dart';

abstract class ListOutletEvent extends Equatable {
  const ListOutletEvent();
}

class FetchOutlet extends ListOutletEvent {
  final String keyword;
  final User user;

  const FetchOutlet({this.keyword, @required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [keyword, user];
}
