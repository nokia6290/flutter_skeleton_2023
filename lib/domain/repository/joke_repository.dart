import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';

abstract class JokeRepository {
  Future<JokeModel> getRandomJoke();
}
