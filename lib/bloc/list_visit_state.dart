part of 'list_visit_bloc.dart';

abstract class ListVisitState extends Equatable {
  const ListVisitState();
}

class ListVisitInitial extends ListVisitState {
  @override
  List<Object> get props => [];
}

class GetDataVisitLoading extends ListVisitState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetDataVisitComplete extends ListVisitState {
  final List<VisitWithOutlet> visitWithOutlet;
  const GetDataVisitComplete(this.visitWithOutlet);

  @override
  // TODO: implement props
  List<Object> get props => [visitWithOutlet];
}
