import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/category.dart';
import 'package:fruit_e_commerce/features/home/domain/use_cases/get_all_categories_use_case.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllCategoriesUSeCase getAllCategoriesUSeCase;
  FirebaseMessaging firebaseMessaging;
  HomeBloc({
    required this.getAllCategoriesUSeCase,
    required this.firebaseMessaging,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetAllCategoriesEvent) {
        emit(HomeLoadingState());
        final faliureOrCategories = await getAllCategoriesUSeCase();
        emit(_mapFaliureOrCategoriesToState(faliureOrCategories));
      } 
      
    });
  }
}

HomeState _mapFaliureOrCategoriesToState(Either<Faliure, List<Category>> either) {
  return either.fold((faliure) => HomeErrorState(faliure: faliure), (categories) => HomeSuccessState(categories: categories));
}
