import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  final String errorCode;
  AuthFailure({
    required this.errorCode,
  });
}

class EmailNotVerifiedFailure extends Failure {
  @override
  List<Object?> get props => [];
}
