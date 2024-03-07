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

class AuthLoginWithEmailAndPassEvent extends AuthEvent {
  final String email;
  final String password;
 const AuthLoginWithEmailAndPassEvent({required this.email, required this.password});
}

class AuthSaveAdditionalUserDataEvent extends AuthEvent {
  final String adress;
  final String phoneNumber;
  final String? fcmToken;
  const AuthSaveAdditionalUserDataEvent({
    required this.adress,
    required this.phoneNumber,
    required this.fcmToken,
  });
  @override
  List<Object> get props => [];
}
class SendEmailVerificationEvent extends AuthEvent{
    @override
  List<Object> get props => [];
}
class ResetPasswordEvent extends AuthEvent{
  final String email;
  const ResetPasswordEvent({required this.email});
  @override
  List<Object> get props => [];
}