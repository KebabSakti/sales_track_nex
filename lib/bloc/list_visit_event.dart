part of 'list_visit_bloc.dart';

abstract class ListVisitEvent extends Equatable {
  const ListVisitEvent();
}

class GetDataVisit extends ListVisitEvent {
  final String userId, keyword;
  final DateTime periodeAwal, periodeAkhir;

  const GetDataVisit(
      {this.keyword,
      @required this.userId,
      @required this.periodeAwal,
      @required this.periodeAkhir});

  @override
  // TODO: implement props
  List<Object> get props => [];
}
