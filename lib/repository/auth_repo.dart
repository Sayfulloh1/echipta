import 'package:dio/dio.dart';
import 'package:e_chipta/core/consants.dart';
import 'package:e_chipta/core/exception.dart';

import '../core/either.dart';
import '../core/failure.dart';
import '../core/local_source.dart';
import '../core/network_info.dart';

class AuthRepository {
  final Dio dio;
  final NetworkInfo networkInfo;
  final LocalSource localSource;

  AuthRepository(this.networkInfo, this.dio, this.localSource);

  Future<Either<Failure, void>> sendOtp({required String phoneNumber}) async {
    if (await networkInfo.isConnected) {
      try {
         await dio.post(
          '${AppConstants.baseUrl}/get-otp',
          data: {
            'phone': phoneNumber,
          },
        );
        return const Right(null);
      } catch (e) {
        if (e is DioException) {
          return Left(
            ServerFailure(
              message: '${e.message}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }

  Future<Either<Failure, void>> verifyOtp({
    required String phoneNumber,
    required String code,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.post(
          '${AppConstants.baseUrl}/verify-otp',
          data: {
            "phone": phoneNumber,
            "code": code,
          },
        );

        final token = response.data['data']['access_token'];
        if (token == null) {
          throw const ServerException(message: 'token empty');
        }
        await localSource.putString('token', token);
        return const Right(null);
      } catch (e) {
        if (e is DioException) {


          return Left(
            ServerFailure(
              message: '${e.response?.data['message']}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        print('repo error is ${e}');

        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }
}
