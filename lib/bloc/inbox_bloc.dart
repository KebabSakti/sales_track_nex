import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/message_model.dart';
import 'package:sales_track_nex/repository/repository.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final Repository repository;

  InboxBloc(this.repository) : super(InboxInitial());

  @override
  Stream<InboxState> mapEventToState(
    InboxEvent event,
  ) async* {
    yield ProcessLoading();

    if (event is FetchMessage) {
      yield* _fetchMessage(event);
    } else if (event is ReadMessage) {
      yield* _readMessage(event);
    } else if (event is SentToken) {
      yield* _sentToken(event);
    }
  }

  Stream<InboxState> _fetchMessage(FetchMessage event) async* {
    var response = await repository.fetchMessage(event.user);

    print(response);

    List<MessageModel> messages = [];
    for (var item in response['data']) {
      messages.add(MessageModel(
        judul: item['title'],
        deskripsi: item['message'],
        createdAt: item['created_at'],
        isRead: item['is_read'],
      ));
    }

    if (messages.length > 0) {
      yield FetchDataComplete(messages);
    } else {
      yield ProcessError();
    }
  }

  Stream<InboxState> _readMessage(ReadMessage event) async* {}

  Stream<InboxState> _sentToken(SentToken event) async* {}
}
