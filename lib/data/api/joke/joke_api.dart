import 'package:dio/dio.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';
import 'package:retrofit/retrofit.dart';

part 'joke_api.g.dart';

@RestApi()
abstract class JokeApi {
  factory JokeApi(Dio dio, {String baseUrl}) = _JokeApi;

  @GET("/jokes/random")
  Future<JokeModel> getJokes();
}
