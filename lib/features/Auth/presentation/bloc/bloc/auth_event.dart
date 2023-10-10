part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final bool isGoogle;
  const AuthLoginEvent({
    required this.isGoogle,
  });
  @override
  List<Object> get props => [];
}
