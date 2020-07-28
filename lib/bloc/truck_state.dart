part of 'truck_bloc.dart';

abstract class TruckState extends Equatable {
  const TruckState();
}

class TruckInitial extends TruckState {
  const TruckInitial();

  @override
  List<Object> get props => [];
}

class GetTrucksLoading extends TruckState {
  final String message;

  const GetTrucksLoading({this.message});

  @override
  List<Object> get props => [message];
}

class GetTrucksCompleted extends TruckState {
  final List<TrukData> truks;

  const GetTrucksCompleted(this.truks);

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetTrucksWithStockSumCompleted extends TruckState {
  final List<TrukWithStokSum> trukWithStokSum;

  const GetTrucksWithStockSumCompleted(this.trukWithStokSum);

  @override
  List<Object> get props => [trukWithStokSum];
}

class GetTrucksError extends TruckState {
  final String message;

  const GetTrucksError({this.message});

  @override
  List<Object> get props => [];
}
