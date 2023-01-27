import 'dart:async';

import 'package:flutter_skeleton_2023/data/api/dio_interceptor.dart';
import 'package:flutter_skeleton_2023/data/api/dio_logging_interceptor.dart';
import 'package:flutter_skeleton_2023/data/api/error_handler.dart';
import 'package:flutter_skeleton_2023/data/repository_impl/joke_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_skeleton_2023/data/api/api_client.dart';
import 'package:flutter_skeleton_2023/data/api/api_service.dart';
import 'package:flutter_skeleton_2023/data/data_store/configurations/flavor_config.dart';
import 'package:flutter_skeleton_2023/data/data_store/configurations/asset_bundler.dart'
    as bundle;

final GetIt di = GetIt.instance;

// must be initiated before main init
initFlavorConfig(Flavor flavor) async {
  final FlavorConfig flavorConfig = FlavorConfig();
  await flavorConfig.initialize(bundle.AssetBundler(), flavor);
  di.registerLazySingleton(() => flavorConfig);
  di.registerLazySingleton(() => flavor);
}

Future<void> init() async {
  _initErrorHandler();
  _initNetworking();

  // di.registerLazySingleton(() => NavigationService());
}

_initNetworking() {
  final Dio dio = Dio(
    BaseOptions(
      contentType: "application/json",
      baseUrl: di.get<FlavorConfig>().backendApiRootUrl,
    ),
  );
  di.registerLazySingleton(() => ApiService(ApiClient(dio)));

  ///repository implementations
  di.registerLazySingleton(
      () => JokeRepositoryImpl(ApiService(ApiClient(dio))));

  ///dio interceptor
  dio.interceptors.addAll([
    DioInterceptor(
        dio: dio,
        errorHandler: di.get<ErrorHandler>(),
    ),
    DioLoggingInterceptor()
  ]);
}

_initErrorHandler() {
  final ErrorHandler errorHandler = ErrorHandler();
  di.registerLazySingleton(() => errorHandler);
}