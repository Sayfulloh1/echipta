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


  //send otp
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
  var token_data;


  //verify otp
  Future<Either<Failure, dynamic>> verifyOtp(
      {required String phoneNumber, required String code}) async {
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
        token_data = token;
        return  Right(token);
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


  //get user info
  Future<Either<Failure, dynamic>> getMe({required String token}) async {
    if (await networkInfo.isConnected) {
      try {
        print('token is $token');
        final response = await dio.get(
          '${AppConstants.baseUrl}/me',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Bearer $token_data",
            },
          ),
        );

        var is_filed = response.data['data']['is_filed'];
        var team = response.data['data']['team'];
        if (is_filed == null) {
          throw const ServerException(message: 'user data empty');
        }
        await localSource.putBool(key: 'is_filed',value: is_filed);

        if (team == null) {
          throw const ServerException(message: 'team empty');
        }
        await localSource.putList('team', team);
        return  Right(response);
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
