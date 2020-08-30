part of 'list_faktur_bloc.dart';

abstract class ListFakturEvent extends Equatable {
  const ListFakturEvent();
}

class FetchFaktur extends ListFakturEvent {
  final String periodeAwal, periodeAkhir, keyword;
  final User user;

  const FetchFaktur(
    this.periodeAwal,
    this.periodeAkhir,
    this.user,
    this.keyword,
  );

  @override
  // TODO: implement props
  List<Object> get props => [periodeAwal, periodeAkhir, user, keyword];
}
