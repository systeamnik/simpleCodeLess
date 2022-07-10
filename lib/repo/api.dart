import 'package:dio/dio.dart';

class Api {
  late final dio = Dio(options)
    ..interceptors.addAll(
      [],
    );

  final options = BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}
