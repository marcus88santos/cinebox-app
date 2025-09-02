
import 'package:cinebox_app/config/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'backend_rest_client_provider.g.dart';

@Riverpod()
Dio backendRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(baseUrl: Env.backendBaseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30)
    ),
  );
  
  dio.options.headers['Content-Type'] = 'application/json';
  dio.interceptors.addAll([LogInterceptor(
    request: true,
    requestHeader: true,
    responseBody: true,
    requestBody: true,
    error: true
  )]);

  return dio;
} 