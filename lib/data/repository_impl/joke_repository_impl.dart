import 'package:flutter_skeleton_2023/data/api/joke/joke_api.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';
import 'package:flutter_skeleton_2023/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final JokeApi _jokeApi;

  JokeRepositoryImpl(
    this._jokeApi,
  );

  @override
  Future<JokeModel> getRandomJoke() async {
    JokeModel randomJoke = await _jokeApi.getJokes();
    return randomJoke;
  }
}
