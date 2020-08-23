part of 'foto_bloc.dart';

abstract class FotoState extends Equatable {
  final List<String> foto;
  const FotoState(this.foto);

  @override
  List<Object> get props => [foto];
}

class FotoInitial extends FotoState {
  const FotoInitial(List<String> foto) : super(foto);
}

class SaveFotoLoading extends FotoState {
  const SaveFotoLoading(List<String> foto) : super(foto);
}

class SaveFotoComplete extends FotoState {
  final List<String> foto;
  const SaveFotoComplete(this.foto) : super(foto);
}

class ResetFotoComplete extends FotoState {
  const ResetFotoComplete(List<String> foto) : super(foto);
}
