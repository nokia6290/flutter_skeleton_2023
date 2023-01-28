import 'dart:async';

import 'package:flutter_skeleton_2023/data/api/dio_interceptor.dart';
import 'package:flutter_skeleton_2023/data/api/dio_logging_interceptor.dart';
import 'package:flutter_skeleton_2023/data/api/error_handler.dart';
import 'package:flutter_skeleton_2023/data/api/joke/joke_api.dart';
import 'package:flutter_skeleton_2023/data/repository_impl/joke_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_skeleton_2023/data/data_store/configurations/flavor_config.dart';
import 'package:flutter_skeleton_2023/data/data_store/configurations/asset_bundler.dart'
    as bundle;
import 'package:sentry_dio/sentry_dio.dart';

final GetIt di = GetIt.instance;

// must be initiated before main init
initFlavorConfig(Flavor flavor) async {
  final FlavorConfig flavorConfig = FlavorConfig();
  await flavorConfig.initialize(bundle.AssetBundler(), flavor);
  di.registerLazySingleton(() => flavorConfig);
  di.registerLazySingleton(() => flavor);
}

Future<void> initDependencyInjector() async {
  _initErrorHandler();
  _initNetworking();
  _initNetworkingInterceptor();
  _initRepositoryImplementations();

  // di.registerLazySingleton(() => NavigationService());
}

_initNetworking() {
  di.registerLazySingleton(() => Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: di.get<FlavorConfig>().backendApiRootUrl,
        ),
      ));
}

_initNetworkingInterceptor() {
  final Dio dio = di.get<Dio>();

  dio.interceptors.addAll([
    DioInterceptor(
      dio: dio,
      errorHandler: di.get<ErrorHandler>(),
    ),
    DioLoggingInterceptor()
  ]);
  dio.addSentry();
}

_initErrorHandler() {
  final ErrorHandler errorHandler = ErrorHandler();
  di.registerLazySingleton(() => errorHandler);
}

///repository implementations
_initRepositoryImplementations() {
  di.registerLazySingleton(() => JokeRepositoryImpl(JokeApi(di.get<Dio>())));
}
