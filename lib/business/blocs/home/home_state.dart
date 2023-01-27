import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton_2023/data/api/app_error.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitState extends HomeState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorState extends HomeState {
  final AppError error;

  const ErrorState(this.error);

  @override
  List<Object> get props => <Object>[error];
}

class SuccessGetJokeState extends HomeState {
  final JokeModel randomJoke;

  const SuccessGetJokeState({
    required this.randomJoke,
  });

  @override
  List<Object> get props => <Object>[randomJoke];
}
