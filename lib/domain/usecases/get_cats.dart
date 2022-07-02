import 'package:cats/domain/models/cat.dart';
import 'package:dartz/dartz.dart';
import 'package:cats/data/repository/cats_repository.dart';

class GetCatsUseCase {
  final CatsRepository? _catsRepository;

  GetCatsUseCase(this._catsRepository);

  Future<Either<String, List<Cat>>> execute(String? name) async {
    return await _catsRepository!.getCats(name);
  }
}
