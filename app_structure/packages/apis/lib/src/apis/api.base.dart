//ignore_for_file: implicit_dynamic_parameter
//ignore_for_file: implicit_dynamic_method
//ignore_for_file: implicit_dynamic_type
//ignore_for_file: avoid_dynamic_calls
//ignore_for_file: implicit_dynamic_map_literal, lines_longer_than_80_chars

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:models/models.dart';
import 'package:services/services.dart' as services;

class BaseApiProvider {
  static Dio get getDioInstance {
    final instance = Dio(
      BaseOptions(
        baseUrl: 'https://your.server.url/api/',
        connectTimeout: const Duration(milliseconds: 50000),
        receiveTimeout: const Duration(milliseconds: 50000),
        contentType: ContentType.json.toString(),
        headers: {'Bearer': _getToken()},
        followRedirects: true,
      ),
    );

    // instance.interceptors.add(LoggyDioInterceptor());
    // instance.interceptors.add(CustomInterceptors());
    instance.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          hitCacheOnErrorExcept: [401, 403],
          maxStale: const Duration(days: 7),
        ),
      ),
    );
    // (instance.httpClientAdapter as DefaultHttpClientAdapter)
    //     .onHttpClientCreate = (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    instance.httpClientAdapter = IOHttpClientAdapter(
      onHttpClientCreate: (_) {
        // Don't trust any certificate just because their root cert is trusted.
        final client = HttpClient(context: SecurityContext())
          // You can test the intermediate / root cert here. We just ignore it.
          ..badCertificateCallback = (cert, host, port) => true;
        return client;
      },
      validateCertificate: (cert, host, port) {
        // Check that the cert fingerprint matches the one we expect.
        // We definitely require _some_ certificate.
        if (cert == null) {
          return false;
        }
        // Validate it any way you want. Here we only check that
        // the fingerprint matches the OpenSSL SHA256.
        return true;
      },
    );
    return instance;
  }

  static Exception handleError(DioError error) {
    if (error.response?.statusCode == null) {
      return const TimeoutException(
        statusCode: 500,
        message: 'Connection timed out, Please try again later.',
      );
    }
    final dynamic data = error.response!.data;
    var serverMessage = 'Something went wrong, Please try again.';
    if (data is String) {
      return const InternalServerErrorException(
        statusCode: 500,
        message: 'Something went wrong, Please try again.',
      );
    }
    if (data['Error'] != null) {
      final dynamic error = data['Error'][0];
      serverMessage = error!['Result'].toString();
    }
    switch (error.response!.statusCode!) {
      case 403:
        return const DisabledException(
          statusCode: 403,
          message: '''
        Your Account is disabled. Please contact support if this is in error''',
        );
      case 404:
        return const NotFoundException(
          statusCode: 404,
          message: 'Your request was not found. Please try again.',
        );
      case 422:
      case 500:
        return InternalServerErrorException(
          statusCode: error.response!.statusCode!,
          message: 'Something went wrong, Please try again.',
        );
      case 503:
        return const ServerUnavailableException(
          statusCode: 503,
          message: 'Server is temporarily unavailable. Please try again later.',
        );
    }
    return InternalServerErrorException(
      statusCode: 500,
      message: serverMessage,
    );
  }

  static String _getToken() {
    return services.MemoryStorageService().getStorageValue<String>(
          storageKey: AppConsts.appStorageKeys.authJwtToken,
        ) ??
        '';
  }
}

// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     services.AppLogger.logError(
//       'REQUEST[${options.method}] => PATH: ${options.path}',
//     );
//     return super.onRequest(options, handler);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     services.AppLogger.logError(
//       'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
//     );
//     super.onError(err, handler);
//   }

//   @override
//   void onResponse(
//     // ignore: strict_raw_type
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) {
//     services.AppLogger.logError(
//       'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
//     );
//     super.onResponse(response, handler);
//   }
// }
