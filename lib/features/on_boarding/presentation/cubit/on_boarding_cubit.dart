import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int onBoardingPageNumber = 0;

  void changeOnBoardingPage(int pageNumber) {
    onBoardingPageNumber = pageNumber;
    emit(OnBoardingPageChangedState(pageNumber: pageNumber));
  }
}
