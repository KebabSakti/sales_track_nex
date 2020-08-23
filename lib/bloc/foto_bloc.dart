import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'foto_event.dart';
part 'foto_state.dart';

class FotoBloc extends Bloc<FotoEvent, FotoState> {
  FotoBloc() : super(FotoInitial([]));

  @override
  Stream<FotoState> mapEventToState(
    FotoEvent event,
  ) async* {
    // TODO: implement mapEventToState
    yield SaveFotoLoading(state.foto);

    if (event is SaveFoto) {
      yield* _saveFoto(event);
    } else if (event is SaveListFoto) {
      yield* _saveListFoto(event);
    } else if (event is ResetFoto) {
      yield ResetFotoComplete([]);
    }
  }

  Stream<FotoState> _saveFoto(SaveFoto event) async* {
    List<String> newFoto = [];

    for (var path in state.foto) newFoto.add(path);
    newFoto.add(event.path);

    yield SaveFotoComplete(newFoto);
  }

  Stream<FotoState> _saveListFoto(SaveListFoto event) async* {
    yield SaveFotoComplete(event.foto);
  }
}
