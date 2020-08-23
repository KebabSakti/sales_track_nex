import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc(this.repository) : super(null);

  final Repository repository;

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    yield NavigateLoading();

    if (event is NavigationInitial) {
      yield SetPageIndex(0);
    } else if (event is NavigateToPageIndex) {
      yield SetPageIndex(event.index);
    } else if (event is NavigateLogout) {
      await repository.deleteUsers();
      yield NavigateLogoutCompleted();
    } else {
      yield NavigateError("Terjadi kesalahan, coba beberapa saat lagi");
    }
  }
}
