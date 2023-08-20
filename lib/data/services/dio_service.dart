import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

/// Abstraction of dio library to Api REST implementations
class DioRestService<V> {
  /// Use optional [interceptors] to configure a interceptors list
  final List<Interceptor> interceptors;

  /// Optional [catchErrors] to get DioError. This is usuful when need
  /// transform a DioError to custom error.
  final V Function(DioException)? catchErrors;

  /// Receive timeout in miliseconds
  ///
  /// By default `15` seconds
  final int receiveTimeout;

  /// Connect timeout in miliseconds
  ///
  /// By default `15` seconds
  final int connectTimeout;

  /// Send timeout in miliseconds
  ///
  /// By default `15` seconds
  final int sendTimeout;

  /// Valid codes to requests
  /// If some code is outside this list, the request will be throw a DioError
  ///
  /// By default `[200]`
  final List<int> validCodes;

  /// Http request headers. The keys of initial headers will be converted to
  /// lowercase, for example 'Content-Type' will be converted to 'content-type'.

  /// The key of Header Map is case-insensitive,
  /// eg: content-type and Content-Type are regard as the same key.
  final Map<String, dynamic>? headers;

  late Dio dio;

  DioRestService({
    this.interceptors = const [],
    this.catchErrors,
    this.receiveTimeout = 15000,
    this.connectTimeout = 15000,
    this.sendTimeout = 15000,
    this.validCodes = const [200],
    this.headers,
  }) {
    _initClient();
  }

  void _initClient() {
    final Dio initDio = Dio(
      BaseOptions(
        receiveTimeout: Duration(milliseconds: receiveTimeout),
        connectTimeout: Duration(milliseconds: connectTimeout),
        sendTimeout: Duration(milliseconds: sendTimeout),
        headers: headers,
        validateStatus: (int? code) => validCodes.contains(code),
      ),
    );

    if (interceptors.isNotEmpty) {
      initDio.interceptors.addAll(interceptors);
    }
    dio = initDio;
  }

  Future<Either<V, T>> get<T>(
    Uri uri, {
    Map<String, dynamic>? headers,
  }) async {
    return _tryCatch(
      () async {
        final response = await dio.getUri<T>(
          uri,
          options: Options(headers: headers),
        );
        return Future.value(response.data);
      },
    );
  }

  Future<Either<V, T>> post<T>(
    Uri uri, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    return _tryCatch(
      () async {
        final response = await dio.postUri<T>(
          uri,
          data: data,
          options: Options(headers: headers),
        );
        return Future.value(response.data);
      },
    );
  }

  Future<Either<V, T>> put<T>(
    Uri uri, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    return _tryCatch(
      () async {
        final response = await dio.putUri<T>(
          uri,
          data: data,
          options: Options(headers: headers),
        );
        return Future.value(response.data);
      },
    );
  }

  Future<Either<V, T>> delete<T>(
    Uri uri, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    return _tryCatch(
      () async {
        final response = await dio.deleteUri<T>(
          uri,
          data: data,
          options: Options(headers: headers),
        );
        return Future.value(response.data);
      },
    );
  }

  Future<Either<V, T>> _tryCatch<T>(Future<T> Function() function) async {
    try {
      final result = await function();
      return Right(result);
    } on DioException catch (e) {
      log('$runtimeType/DioError: ${e.error?.toString() ?? e.message}');
      if (catchErrors == null) {
        rethrow;
      }
      return Left(catchErrors!(e));
    } catch (e) {
      rethrow;
    }
  }
}
