import 'package:cats/app/cats/bloc/cats_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cats/data/repository/cats_repository.dart';
import 'package:cats/domain/usecases/get_cats.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory(() => CatsBloc(getIt()));

  getIt.registerLazySingleton(() => GetCatsUseCase(getIt()));

  getIt.registerLazySingleton<CatsRepository>(
      () => CatsRepositoryNetwork());
}
