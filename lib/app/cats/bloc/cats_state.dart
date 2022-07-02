part of 'cats_bloc.dart';

@immutable
abstract class CatsState extends Equatable {
  const CatsState();

  @override
  List<Object> get props => [];
}

class InitialState extends CatsState {}

class LoadingState extends CatsState {}

class SuccessfulState extends CatsState {
  final List<Cat> characters;
  const SuccessfulState(this.characters);
}

class ErrorState extends CatsState {
  final String message;
  const ErrorState(this.message);
}
