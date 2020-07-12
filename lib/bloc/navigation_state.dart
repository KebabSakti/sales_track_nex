part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();

  @override
  List<Object> get props => [];
}

class SetPageIndex extends NavigationState {
  final int index;
  const SetPageIndex(this.index);

  @override
  List<Object> get props => [index];
}

class NavigateLoading extends NavigationState {
  const NavigateLoading();

  @override
  List<Object> get props => [];
}

class NavigateLogoutCompleted extends NavigationState {
  const NavigateLogoutCompleted();

  @override
  List<Object> get props => [];
}

class NavigateError extends NavigationState {
  final String message;
  const NavigateError(this.message);

  @override
  List<Object> get props => [message];
}
