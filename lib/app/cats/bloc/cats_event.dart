part of 'cats_bloc.dart';

@immutable
abstract class CatsEvent extends Equatable {
  const CatsEvent();

  @override
  List<Object> get props => [];
}

class OnCatsEvent extends CatsEvent {
  final String? name;
  const OnCatsEvent(this.name);
}
