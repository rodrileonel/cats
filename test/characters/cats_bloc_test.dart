import 'package:bloc_test/bloc_test.dart';
import 'package:cats/app/cats/bloc/cats_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cats/domain/usecases/get_cats.dart';
import 'package:cats/core/di.dart' as di;

class MockGetCharactersUseCase extends Mock implements GetCatsUseCase {}

void main() {
  late MockGetCharactersUseCase? mockGetCat;
  late CatsBloc? usersBloc;

  setUpAll(() {
    di.init();
    mockGetCat = MockGetCharactersUseCase();
    usersBloc = CatsBloc(mockGetCat);
  });

  tearDown(() {
    usersBloc?.close();
  });

  test('should initial state equals to InitialState', () async {
    expect(usersBloc?.state, equals(InitialState()));
  });

  blocTest<CatsBloc, CatsState>(
    'emits Loading and SuccessfulState',
    build: () {
      when(() => mockGetCat?.execute(''))
          .thenAnswer((any) async => const Right([]));
      return CatsBloc(mockGetCat);
    },
    act: (bloc) => bloc.add(const OnCatsEvent('')),
    expect: () => [LoadingState(), const SuccessfulState([])],
  );

  blocTest<CatsBloc, CatsState>(
    'emits Loading and ErrorState',
    build: () {
      when(() => mockGetCat?.execute(''))
          .thenAnswer((any) async => const Left(''));
      return CatsBloc(mockGetCat);
    },
    act: (bloc) => bloc.add(const OnCatsEvent('')),
    expect: () => [LoadingState(), const ErrorState('')],
  );
}
