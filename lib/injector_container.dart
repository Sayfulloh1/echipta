import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:e_chipta/core/local_source.dart';
import 'package:e_chipta/repository/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'core/internet_connection_checker.dart';
import 'core/network_info.dart';

final sl = GetIt.instance;

final networkInfo = sl<NetworkInfo>();

Future<void> init() async {
  /// Dio
  sl
    ..registerLazySingleton(
      () => Dio()
        ..options = BaseOptions(
          contentType: 'application/json',
          sendTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
        ..httpClientAdapter = IOHttpClientAdapter(
          // createHttpClient: () {
          //   final HttpClient client = HttpClient()
          //     ..badCertificateCallback =
          //         (X509Certificate cert, String host, __) {
          //       log('cert: ${cert.pem}');
          //       log('host: $host');
          //       return cert.pem == localSource.certificate;
          //     };
          //   return client;
          // },
          validateCertificate: (X509Certificate? cert, String host, __) {
            // log('cert: ${cert?.pem}');
            // log('host: $host');
            if (cert == null) {
              return true;
            }
            return true;
          },
        )
        ..interceptors.addAll(
          [
            // chuck.getDioInterceptor(),
            LogInterceptor(
              request: kDebugMode,
              requestHeader: kDebugMode,
              requestBody: kDebugMode,
              responseHeader: kDebugMode,
              responseBody: kDebugMode,
              error: kDebugMode,
              logPrint: (object) {
                if (kDebugMode) {
                  log('dio: $object');
                }
              },
            ),
          ],
        ),
    )

    /// Core

    ..registerLazySingleton(
      () => InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 3),
      ),
    )
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(() => LocalSource());

  /// features

  authFeature();
}

void authFeature() {
  ///
  sl.registerLazySingleton(
    () => ApiRepository(sl(), sl(), sl()),
  );
}
