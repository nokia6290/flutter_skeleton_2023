import 'dart:async';

import 'package:flutter_skeleton_2023/data/api/api_client.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';

class ApiService {
  final ApiClient apiClient;

  ApiService(this.apiClient);

  Future<JokeModel> getJokes() {
    return apiClient.getJokes();
  }
}
