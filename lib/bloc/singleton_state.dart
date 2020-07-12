part of 'singleton_bloc.dart';

abstract class SingletonState extends Equatable {
  const SingletonState();
}

class SingletonInitial extends SingletonState {
  const SingletonInitial();

  @override
  List<Object> get props => [];
}
