part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntity user;

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
  List<Object> get props => [errorMessage];
}

class SendVerificationOrResetEmailSuccessState extends AuthState {
  final String successMessage;
  const SendVerificationOrResetEmailSuccessState(
    this.successMessage,
  );
  @override
  List<Object> get props => [];
}

class SendVerificationOrResetEmailErrorState extends AuthState {
  final String errorMessage;

  const SendVerificationOrResetEmailErrorState(this.errorMessage);
}

class AdditionalUserDataSuccessState extends AuthState {
  const AdditionalUserDataSuccessState();
  @override
  List<Object> get props => [];
}

class AdditionalUserDataErrorState extends AuthState {
  final String errorMessage;
  const AdditionalUserDataErrorState({required this.errorMessage});
  @override
  List<Object> get props => [];
}

class AdditionalUserDataLoadingState extends AuthState {
  const AdditionalUserDataLoadingState();
  @override
  List<Object> get props => [];
}
