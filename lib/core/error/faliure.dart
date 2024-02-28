import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {
  final String faliureName;
  const Faliure({
    required this.faliureName,
  });

  @override
  List<Object?> get props => [faliureName];
}

class ServerFaliure extends Faliure {
  const ServerFaliure({required super.faliureName});

  @override
  List<Object?> get props => [faliureName];
}

class ConnectionFaliure extends Faliure {
  const ConnectionFaliure({String name = "No Internet"}) : super(faliureName: name);

  @override
  List<Object?> get props => [faliureName];
}
