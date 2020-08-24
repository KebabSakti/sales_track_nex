part of 'list_visit_bloc.dart';

abstract class ListVisitState extends Equatable {
  final List<VisitWithOutlet> visitWithOutlet;

  const ListVisitState(this.visitWithOutlet);
}

class ListVisitInitial extends ListVisitState {
  ListVisitInitial() : super(null);

  @override
  List<Object> get props => [];
}

class GetDataVisitLoading extends ListVisitState {
  GetDataVisitLoading(List<VisitWithOutlet> visitWithOutlet)
      : super(visitWithOutlet);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetDataVisitComplete extends ListVisitState {
  final List<VisitWithOutlet> visitWithOutlet;

  const GetDataVisitComplete(this.visitWithOutlet) : super(visitWithOutlet);

  @override
  // TODO: implement props
  List<Object> get props => [visitWithOutlet];
}

class GetDataVisitError extends ListVisitState {
  GetDataVisitError() : super(null);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
