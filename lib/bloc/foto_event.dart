part of 'foto_bloc.dart';

abstract class FotoEvent extends Equatable {
  const FotoEvent();
}

class SaveFoto extends FotoEvent {
  final String path;

  const SaveFoto(this.path);

  @override
  // TODO: implement props
  List<Object> get props => [path];
}

class SaveListFoto extends FotoEvent {
  final List<String> foto;
  const SaveListFoto(this.foto);

  @override
  // TODO: implement props
  List<Object> get props => [foto];
}

class ResetFoto extends FotoEvent {
  const ResetFoto();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
