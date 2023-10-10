import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';

import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserLoginUseCase userLoginUseCase;
  AuthBloc(
    this.userLoginUseCase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthLoginEvent) {
        emit(AuthLoadingState());
        final failureOrUser = await userLoginUseCase.login(isGoogle: event.isGoogle);
        failureOrUser.fold((faliure) => emit(const AuthErrorState(errorMessage: "cant sign In")), (user) => emit(AuthSuccessState(user: user)));
      }
    });
  }
}
