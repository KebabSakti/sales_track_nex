part of 'inbox_bloc.dart';

abstract class InboxEvent extends Equatable {
  const InboxEvent();
}

class SentToken extends InboxEvent {
  final User user;
  final String token;
  const SentToken(this.token, this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user, token];
}

class FetchMessage extends InboxEvent {
  final User user;
  const FetchMessage(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ReadMessage extends InboxEvent {
  final String messageId;
  const ReadMessage(this.messageId);

  @override
  // TODO: implement props
  List<Object> get props => [messageId];
}
