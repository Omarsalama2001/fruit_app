import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/save_userdata_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserLoginUseCase userLoginUseCase;
  SaveAdditionalUserdataUseCase saveAdditionalUserdataUseCase;
  AuthBloc(
    this.userLoginUseCase,
    this.saveAdditionalUserdataUseCase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthLoginEvent) {
        emit(AuthLoadingState());
        final failureOrUser = await userLoginUseCase.login(isGoogle: event.isGoogle);
        failureOrUser.fold((faliure) => emit(AuthErrorState(errorMessage: faliure.faliureName)), (user) => emit(AuthSuccessState(user: user)));
      } else if (event is AuthSaveAdditionalUserDataEvent) {
        emit(const AdditionalUserDataLoadingState());
        final failureOrUnit=await saveAdditionalUserdataUseCase(adress: event.adress, phoneNumber: event.phoneNumber, fcmToken: event.fcmToken);
        failureOrUnit.fold((l) => emit(const AdditionalUserDataErrorState(errorMessage: 'something went wrong' )), (r) => emit(const AdditionalUserDataSuccessState()));
      }
      }
    );
  }
}
