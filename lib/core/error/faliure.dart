import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {}

class ServerFaliure extends Faliure {
  final String exceptionName;

  ServerFaliure({required this.exceptionName});
  @override
  List<Object?> get props => [exceptionName];
}
