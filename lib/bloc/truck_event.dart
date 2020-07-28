part of 'truck_bloc.dart';

abstract class TruckEvent extends Equatable {
  const TruckEvent();
}

class GetTrucks extends TruckEvent {
  const GetTrucks();

  @override
  List<Object> get props => [];
}

class GetTrucksWithStokSum extends TruckEvent {
  const GetTrucksWithStokSum();

  @override
  List<Object> get props => [];
}
