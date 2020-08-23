part of 'visit_bloc.dart';

abstract class VisitState extends Equatable {
  const VisitState(this.outletData);

  final OutletData outletData;
}

class VisitInitial extends VisitState {
  const VisitInitial() : super(null);

  @override
  List<Object> get props => [];
}

class ValidateOutletComplete extends VisitState {
  const ValidateOutletComplete({@required this.outletData}) : super(outletData);

  final OutletData outletData;

  @override
  // TODO: implement props
  List<Object> get props => [outletData];
}

class ValidateOutletError extends VisitState {
  ValidateOutletError({this.message}) : super(null);

  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class ResetVisitDataComplete extends VisitState {
  const ResetVisitDataComplete() : super(null);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SubmitVisitComplete extends VisitState {
  const SubmitVisitComplete() : super(null);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
