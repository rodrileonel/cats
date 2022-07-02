import 'dart:async';

import 'package:cats/data/response/cats_response.dart';
import 'package:cats/data/response/error_response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:cats/core/constants.dart';
import 'package:cats/data/environments.dart';

class CatsApi {
  Future<Either<ErrorResponse, List<CatResponse>>> getCats(String? name) async {
    try {
      late Uri uri;
      if(name==null || name==''){
        uri = Uri.parse('${Environments.apiUrl}/breeds');
      }else {
        uri = Uri.parse('${Environments.apiUrl}/breeds/search?q=$name');
      }
      final response = await http.get(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': Environments.apiKey,
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(catResponseFromJson(response.body));
      } else {
        return Left(errorResponseFromJson(response.body));
      }
    } catch (e) {
      return Left(ErrorResponse(error: UNKNOW_ERROR));
    }
  }
}
