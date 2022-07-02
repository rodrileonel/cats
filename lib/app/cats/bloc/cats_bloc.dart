// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cats/domain/models/cat.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cats/core/constants.dart';
import 'package:cats/domain/usecases/get_cats.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final GetCatsUseCase? _getCatsUseCase;

  CatsBloc(this._getCatsUseCase) : super(InitialState()) {
    on<OnCatsEvent>((event, emit) async {
      emit(LoadingState());
      try {
        var response =
            await _getCatsUseCase?.execute(event.name);
        response?.fold((error) {
          emit(ErrorState(error));
        }, (characters) {
          emit(SuccessfulState(characters));
        });
      } catch (e) {
        emit(const ErrorState(UNKNOW_ERROR));
      }
    });
  }
}
