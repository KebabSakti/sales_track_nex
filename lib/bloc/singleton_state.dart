part of 'singleton_bloc.dart';

abstract class SingletonState extends Equatable {
  const SingletonState(this.repository);
  final Repository repository;
}

class SingletonInitial extends SingletonState {
  const SingletonInitial(Repository repository) : super(repository);

  @override
  List<Object> get props => [];
}
