import 'package:cats/data/environments.dart';
import 'package:cats/data/response/cats_response.dart';
import 'package:cats/domain/models/cat.dart';
import 'package:dartz/dartz.dart';
import 'package:cats/core/constants.dart';
import 'package:cats/data/api/cats_api.dart';

abstract class CatsRepository {
  Future<Either<String, List<Cat>>> getCats(String? name);
}

class CatsRepositoryNetwork implements CatsRepository {
  final catsApi = CatsApi();

  @override
  Future<Either<String, List<Cat>>> getCats(String? name) async {
    List<Cat>? c = [];
    final cts = await catsApi.getCats(name);
    return cts.fold((error) {
      return Left(error.error ?? UNKNOW_ERROR);
    }, (cats) async {
      for (CatResponse cat in cats) {
        c.add(Cat(
          name: cat.name,
          temperament: cat.temperament,
          origin: cat.origin,
          description: cat.description,
          adaptability: cat.adaptability,
          intelligence: cat.intelligence,
          lifeSpan: cat.lifeSpan,
          altNames: cat.altNames,
          image: cat.referenceImageId!=null ? '${Environments.imageRepo}/images/${cat.referenceImageId}.jpg' : IMG
        ));
      }
      return Right(c);
    });
  }
}
