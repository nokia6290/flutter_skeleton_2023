import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_2023/business/home/home_event.dart';
import 'package:flutter_skeleton_2023/business/home/home_state.dart';
import 'package:flutter_skeleton_2023/data/api/app_error.dart';
import 'package:flutter_skeleton_2023/data/api/error_handler.dart';
import 'package:flutter_skeleton_2023/data/repository_impl/joke_repository_impl.dart';
import 'package:flutter_skeleton_2023/domain/models/joke/joke_model.dart';

class HomeScreenBloc extends Bloc<HomeEvent, HomeState> {
  final ErrorHandler _errorHandler;
  final JokeRepositoryImpl _jokeRepositoryImpl;

  HomeScreenBloc(
    this._errorHandler,
    this._jokeRepositoryImpl,
  ) : super(InitState()) {
    on<HomeEvent>(_getRandomJoke);
  }

  _getRandomJoke(HomeEvent event, Emitter<HomeState> emitter) async {
    emitter.call(LoadingState());
    try {
      final JokeModel result = await _jokeRepositoryImpl.getRandomJoke();
      emitter.call(SuccessGetJokeState(randomJoke: result));
    } catch (error) {
      AppError appError = _errorHandler.convertDioError(error);
      emitter.call(ErrorState(appError));
    }
  }
}
