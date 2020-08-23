class QueryFilterModel {
  final String keyword;
  final DateTime periodeAwal, periodeAkhir;

  QueryFilterModel({this.keyword, this.periodeAwal, this.periodeAkhir});

  QueryFilterModel copyWith(
      String keyword, DateTime periodeAwal, DateTime periodeAkhir) {
    return QueryFilterModel(
      keyword: keyword ?? this.keyword,
      periodeAwal: periodeAwal ?? this.periodeAwal,
      periodeAkhir: periodeAkhir ?? this.periodeAkhir,
    );
  }
}
