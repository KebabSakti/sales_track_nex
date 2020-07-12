part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class NavigateToPageIndex extends NavigationEvent {
  final int index;
  const NavigateToPageIndex(this.index);

  @override
  List<Object> get props => [index];
}

class NavigateLogout extends NavigationEvent {
  const NavigateLogout();

  @override
  List<Object> get props => [];
}
