part of 'list_po_bloc.dart';

abstract class ListPoEvent extends Equatable {
  const ListPoEvent();
}

class FetchPo extends ListPoEvent {
  final String periodeAwal, periodeAkhir, keyword;
  final User user;
  const FetchPo(this.periodeAwal, this.periodeAkhir, this.user, this.keyword);

  @override
  // TODO: implement props
  List<Object> get props => [periodeAwal, periodeAkhir, user, keyword];
}
