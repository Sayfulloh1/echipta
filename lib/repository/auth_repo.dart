import 'package:dio/dio.dart';

import '../core/either.dart';
import '../core/failure.dart';
import '../core/network_info.dart';
import '../model/match.dart';

class AuthRepository {
  final Dio dio;
  final NetworkInfo networkInfo;

  AuthRepository(this.networkInfo, this.dio);

  Future<Either<Failure, Match>> sendOtp() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.post('');
        final model = Match.fromJson(response.data);
        return Right(model);
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
}
