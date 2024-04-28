import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_chipta/core/consants.dart';
import 'package:e_chipta/core/exception.dart';
import 'package:flutter/foundation.dart';

import '../core/either.dart';
import '../core/failure.dart';
import '../core/local_source.dart';
import '../core/network_info.dart';
import '../model/games_response.dart';
import '../model/match_category.dart';
import '../model/sector_info.dart';
import '../model/team.dart';
import '../model/ticket_info.dart';

class ApiRepository {
  final Dio dio;
  final NetworkInfo networkInfo;
  final LocalSource localSource;

  ApiRepository(this.networkInfo, this.dio, this.localSource);


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
  //get user info
  Future<Either<Failure, dynamic>> getMe() async {
    if (await networkInfo.isConnected) {
      String? token;
      try {
        token =  localSource.getString('token');
      } catch (e) {
        // Handle error retrieving token from local storage (optional)
        print('Error getting token from local storage: $e');
      }

      if (token == null) {
        // No token found, handle this scenario (show login or something)
        return const Left(NoTokenFailure());
      }

      // Now use the token in the network call
      final response = await dio.get(
        '${AppConstants.baseUrl}/me',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      try {
        bool? is_filed = response.data['data']['is_filed'];
        Object? team = response.data['data']['team'];
        if (is_filed == null) {
          throw const ServerException(message: 'user data empty');
        }
        await localSource.putBool(key: 'is_filed', value: is_filed);

        if (team == null) {
          throw const ServerException(message: 'team empty');
        }

        // Encode team Map as JSON before saving
        final teamJson = jsonEncode(team);
        await localSource.putString('team', teamJson);

        return Right(response);
      } catch (e) {
        if (e is DioException) {
          return Left(
            ServerFailure(
              message: '${e.response?.data['message']}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        print('repo error is $e');
        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }



  //update personal data
  Future<Either<Failure, dynamic>> updatePersonalData({
    required String fullName,
    required String birthDate,
    required File pictureFile,
  }) async {
    if (await networkInfo.isConnected) {
      String? token;
      try {
        token = localSource.getString('token');
      } catch (e) {
        // Handle error retrieving token from local storage (optional)
        print('Error getting token from local storage: $e');
        return Left(NoTokenFailure()); // Use specific token failure type
      }

      if (token == null) {
        // No token found, handle this scenario (show login or something)
        return Left(NoTokenFailure());
      }

      final formData = FormData.fromMap({
        "full_name": fullName,
        "birth_date": birthDate,
        "picture": await MultipartFile.fromFile(pictureFile.path,), // Assuming JPEG format, adjust based on your image type
      });

      try {
        final response = await dio.post(
          '${AppConstants.baseUrl}/clients/update-personal-data',
          data: formData,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );

        // Handle successful response (optional)
        // You might want to update local data or perform other actions based on the response
        return Right(response.data);
      } catch (e) {
        if (e is DioException) {
          return Left(
            ServerFailure(
              message: '${e.response?.data['message']}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        if (kDebugMode) {
          print('repo error is $e');
        }
        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }


  // get all teams
  Future<Either<Failure, List<Team>>> getTeams() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.get(
          'https://test-api.echipta.uz/api/teams/all',
        );

        if (response.statusCode == 200) {
          final data = response.data['data'] as List;
          final teams = data.map((teamData) => Team.fromJson(teamData)).toList();
          return Right(teams);
        } else {
          // Handle non-200 status codes (optional)
          return Left(ServerFailure(
              message: 'Unexpected response code: ${response.statusCode}',
              statusCode: response.statusCode));
        }
      } on DioException catch (e) {
        return Left(
          ServerFailure(
            message: '${e.response?.data['message']}',
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
              return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }


  //update team
  Future<Either<Failure, dynamic>> updateTeam({required int teamId}) async {
    if (await networkInfo.isConnected) {
      String? token;
      try {
        token = localSource.getString('token');
      } catch (e) {
        // Handle error retrieving token from local storage (optional)
        print('Error getting token from local storage: $e');
        return const Left(NoTokenFailure()); // Use specific token failure type
      }

      if (token == null) {
        // No token found, handle this scenario (show login or something)
        return Left(NoTokenFailure());
      }

      final data = {'team_id': teamId};

      try {
        final response = await dio.post(
          '${AppConstants.baseUrl}/teams/update', // Assuming the actual update endpoint
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );

        // Handle successful response (optional)
        // You might want to update local data or perform other actions based on the response
        return Right(response.data);
      } catch (e) {
        if (e is DioError) {
          return Left(
            ServerFailure(
              message: '${e.response?.data['message']}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        print('repo error is $e');
        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  //getch match categories
  Future<Either<Failure, List<MatchCategory>>> getMatchCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.get(
            'https://test-api.echipta.uz/api/games/get-match-categories');

        if (response.statusCode == 200) {
          final data = response.data['data'] as List;
          final matchCategories = data
              .map((categoryData) => MatchCategory.fromJson(categoryData))
              .toList();
          return Right(matchCategories);
        } else {
          // Handle non-200 status codes (optional)
          return Left(ServerFailure(
              message: 'Unexpected response code: ${response.statusCode}',
              statusCode: response.statusCode));
        }
      } on DioException catch (e) {
        return Left(
          ServerFailure(
            message: '${e.response?.data['message']}',
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }

  // get games
  Future<Either<Failure, GamesResponse>> getGames() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.get('https://test-api.echipta.uz/api/games/get-games');

        if (response.statusCode == 200) {
          final data = response.data as Map<String, dynamic>;
          if (data['code'] == 0 && data['message'] == 'success') {
            final gamesResponse = GamesResponse.fromJson(data['data']);
            return Right(gamesResponse);
          } else {
            // Handle API error
            print('API error: ${data['message']}');
            throw Exception('Failed to get games');
          }
        } else {
          // Handle general error
          print('Error fetching games: ${response.statusCode}');
          throw Exception('Failed to get games');
        }
      } catch (error) {
        // Handle exceptions
        print('Error: $error');
        throw Exception('Failed to get games');
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }


  //get sector info
  Future<Either<Failure, SectorInfo>> getSectorInfo(String sector) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.get(
          'https://test-api.echipta.uz/api/games/get-sector-info',
          queryParameters: {'sector': sector},
        );

        if (response.statusCode == 200) {
          final data = response.data as Map<String, dynamic>;
          if (data['code'] == 0 && data['message'] == 'success') {
            final sectorInfo = SectorInfo.fromJson(data['data']);
            return Right(sectorInfo);
          } else {
            // Handle API error
            print('API error: ${data['message']}');
            throw Exception('Failed to get sector info');
          }
        } else {
          // Handle general error
          print('Error fetching sector info: ${response.statusCode}');
          throw Exception('Failed to get sector info');
        }
      } catch (error) {
        // Handle exceptions
        print('Error: $error');
        throw Exception('Failed to get sector info');
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }


  //get ticket info
  Future<Either<Failure, TicketInfo>> getTicketInfo({
    required int matchId,
    required String sector,
    required int row,
    required int seat,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final data = {
          'match_id': matchId,
          'sector': sector,
          'row': row,
          'seat': seat,
        };

        final response = await dio.post(
          'https://test-api.echipta.uz/api/games/get-ticket-info',
          data: data,
        );

        if (response.statusCode == 200) {
          final responseData = response.data as Map<String, dynamic>;
          if (responseData['code'] == 0 && responseData['message'] == 'success') {
            final ticketInfo = TicketInfo.fromJson(responseData['data']);
            return Right(ticketInfo);
          } else {
            // Handle API error
            print('API error: ${responseData['message']}');
            throw Exception('Failed to get ticket info');
          }
        } else {
          // Handle general error
          print('Error fetching ticket info: ${response.statusCode}');
          throw Exception('Failed to get ticket info');
        }
      } catch (error) {
        // Handle exceptions
        print('Error: $error');
        throw Exception('Failed to get ticket info');
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }




  // ticket payment
  Future<Either<Failure, void>> ticketPayment({
    required int matchId,
    required String sector,
    required int row,
    required int seat,
    required String paymentType,
  }) async {
    if (await networkInfo.isConnected) {
      String? token;
      try {
        token = localSource.getString('token');
      } catch (e) {
        // Handle error retrieving token from local storage (optional)
        print('Error getting token from local storage: $e');
        return Left(NoTokenFailure()); // Use specific token failure type
      }

      if (token == null) {
        // No token found, handle this scenario (show login or something)
        return const Left(NoTokenFailure());
      }

      final data = {
        'match_id': matchId,
        'sector': sector,
        'row': row,
        'seat': seat,
        'payment_type': paymentType,
      };

      final options = Options(headers: {'Authorization': 'Bearer $token'});

      try {
        final response = await dio.post(
          'https://test-api.echipta.uz/api/games/ticket-payment',
          data: data,
          options: options,
        );

        if (response.statusCode == 200) {
          final responseData = response.data as Map<String, dynamic>;
          if (responseData['code'] == 0 && responseData['message'] == 'successfully payed') {
            return const Right(null); // Consider returning relevant data if needed
          } else {
            // Handle API error
            print('API error: ${responseData['message']}');
            throw Exception('Failed to make ticket payment');
          }
        } else {
          // Handle general error
          print('Error making ticket payment: ${response.statusCode}');
          throw Exception('Failed to make ticket payment');
        }
      } catch (error) {
        // Handle exceptions
        print('Error: $error');
        throw Exception('Failed to make ticket payment');
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }











}










