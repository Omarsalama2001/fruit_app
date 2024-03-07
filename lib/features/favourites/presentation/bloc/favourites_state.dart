part of 'favourites_bloc.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

final class AddItemToFavouriteLoadingState extends FavouritesState {}

final class AddItemToFavouriteSuccessState extends FavouritesState {}

final class AddItemToFavouriteErrorState extends FavouritesState {
  final String errorMessage;

  const AddItemToFavouriteErrorState({required this.errorMessage});
}
