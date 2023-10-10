part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User user;

  const AuthSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

class AuthErrorState extends AuthState {
  final String errorMessage;
  const AuthErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [];
}
