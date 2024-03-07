import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/strings/faliures.dart';
import 'package:fruit_e_commerce/core/strings/messages.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/reset_password_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/save_userdata_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/send_email_verification_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_with_email_and_password.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserLoginUseCase userLoginUseCase;
  UserLoginWithEmailAndPasswordUseCase userLoginWithEmailAndPasswordUseCase;
  SendEmailVerificationUseCase sendEmailVerificationUseCase;
  SaveAdditionalUserdataUseCase saveAdditionalUserdataUseCase;
  ResetPasswordUseCase resetPasswordUseCase;
  AuthBloc(
    this.userLoginUseCase,
    this.userLoginWithEmailAndPasswordUseCase,
    this.sendEmailVerificationUseCase,
    this.saveAdditionalUserdataUseCase,
    this.resetPasswordUseCase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthLoginEvent) {
        emit(AuthLoadingState());
        final failureOrUser = await userLoginUseCase.login(isGoogle: event.isGoogle);
        emit(_mapFailureOrUserToState(failureOrUser));
      } else if (event is AuthLoginWithEmailAndPassEvent) {
        emit(AuthLoadingState());
        final failureOrUser = await userLoginWithEmailAndPasswordUseCase(email: event.email, password: event.password);
        emit(_mapFailureOrUserToState(failureOrUser));
      } else if (event is SendEmailVerificationEvent) {
        final FailureOrUnit = await sendEmailVerificationUseCase();
        emit(_mapFailureorUnitToState(either: FailureOrUnit, successMessage: Verification_Email_Sent, errorMessage: Verification_Email_failed));
      } else if (event is ResetPasswordEvent) {
        final FailureOrUnit = await resetPasswordUseCase(email: event.email);
        emit(_mapFailureorUnitToState(either: FailureOrUnit, successMessage: Reset_Email_Sent, errorMessage: Reset_Email_failed));
      }
    });
  }
}

AuthState _mapFailureOrUserToState(Either<Failure, UserEntity> either) {
  return either.fold((failure) => AuthErrorState(errorMessage: _mapfailureToMessage(failure)), (userEntity) => AuthSuccessState(user: userEntity));
}

AuthState _mapFailureorUnitToState({required Either<Failure, Unit> either, required String successMessage, required String errorMessage}) {
  return either.fold((l) => SendVerificationOrResetEmailErrorState(errorMessage), (r) => SendVerificationOrResetEmailSuccessState(successMessage));
}

String _mapfailureToMessage(Failure Failure) {
  switch (Failure.runtimeType) {
    case ServerFailure:
      return SERVER_Failure_MESSAGE;
    case EmailNotVerifiedFailure:
      return EMAIL_NOT_VERIFIED_MESSAGE;
    case ConnectionFailure:
      return OFFLINE_Failure_MESSAGE;
    case AuthFailure:
      return AUTH_Failure_MESSAGE;
    default:
      return UN_EXCPECTED_ERROR_MESSAGE;
  }
}
