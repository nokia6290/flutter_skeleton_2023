import 'package:flutter_skeleton_2023/data/api/api_client.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';
import 'package:flutter_skeleton_2023/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final ApiClient _apiClient;

  JokeRepositoryImpl(
    this._apiClient,
  );

  @override
  Future<JokeModel> getRandomJoke() async {
    JokeModel randomJoke = await _apiClient.getJokes();
    return randomJoke;
  }
}
