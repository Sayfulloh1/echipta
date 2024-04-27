import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.statusCode,
  });

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({
     super.message='No internet',
    super.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}
class NoTokenFailure extends Failure {
  const NoTokenFailure({
     super.message='No token found',
    super.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({ super.message = 'No cached data found', super.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
