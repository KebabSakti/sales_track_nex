import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';

part 'list_faktur_event.dart';
part 'list_faktur_state.dart';

class ListFakturBloc extends Bloc<ListFakturEvent, ListFakturState> {
  ListFakturBloc() : super(ListFakturInitial());

  @override
  Stream<ListFakturState> mapEventToState(
    ListFakturEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
