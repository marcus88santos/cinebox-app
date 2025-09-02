
import 'package:cinebox_app/config/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'tmdb_rest_client_provider.g.dart';

@Riverpod()
Dio tmdbRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60)
    ),
  );
  
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer ${Env.theMovieDbApiKey}';
  dio.interceptors.addAll([LogInterceptor(
    request: true,
    requestHeader: true,
    responseBody: true,
    requestBody: true,
    error: true
  )]);

  return dio;
} 