part of 'inbox_bloc.dart';

abstract class InboxState extends Equatable {
  const InboxState();
}

class InboxInitial extends InboxState {
  @override
  List<Object> get props => [];
}

class ProcessLoading extends InboxState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchDataComplete extends InboxState {
  final List<MessageModel> messages;
  const FetchDataComplete(this.messages);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProcessComplete extends InboxState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProcessError extends InboxState {
  final String message;
  const ProcessError({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
