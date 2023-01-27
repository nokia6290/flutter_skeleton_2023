import 'package:flutter_skeleton_2023/data/api/api_service.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';
import 'package:flutter_skeleton_2023/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final ApiService _apiService;

  JokeRepositoryImpl(
    this._apiService,
  );

  @override
  Future<JokeModel> getRandomJoke() async {
    JokeModel randomJoke = await _apiService.getJokes();
    return randomJoke;
  }
}
