part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];

  get categories => null;
}

final class HomeInitial extends HomeState {
 
}

class HomeLoadingState extends HomeState {
  
}

// ignore: must_be_immutable
class HomeErrorState extends HomeState {
  Faliure faliure;
  HomeErrorState({
    required this.faliure,
  });
  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<Category> categories;
  const HomeSuccessState({required this.categories});
  @override
  List<Object> get props => [categories];
}
