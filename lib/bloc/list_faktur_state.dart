part of 'list_faktur_bloc.dart';

abstract class ListFakturState extends Equatable {
  const ListFakturState();
}

class ListFakturInitial extends ListFakturState {
  @override
  List<Object> get props => [];
}

class FetchFakturLoading extends ListFakturState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchFakturComplete extends ListFakturState {
  final List<OrderWithOutlet> faktur;
  const FetchFakturComplete(this.faktur);

  @override
  // TODO: implement props
  List<Object> get props => [faktur];
}

class FetchFakturError extends ListFakturState {
  final String message;
  const FetchFakturError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
