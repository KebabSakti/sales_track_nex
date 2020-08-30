part of 'detail_order_bloc.dart';

abstract class DetailOrderState extends Equatable {
  const DetailOrderState();
}

class DetailOrderInitial extends DetailOrderState {
  @override
  List<Object> get props => [];
}

class SubmitFakturLoading extends DetailOrderState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SubmitFakturComplete extends DetailOrderState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SubmitFakturError extends DetailOrderState {
  final String message;
  const SubmitFakturError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
