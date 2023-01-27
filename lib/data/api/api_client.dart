import 'package:dio/dio.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/jokes/random")
  Future<JokeModel> getJokes();
}
