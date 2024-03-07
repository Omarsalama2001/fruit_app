part of 'favourites_bloc.dart';

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class AddItemToFavouritesEvent extends FavouritesEvent {
 final String userId;
 final Item item;
 const AddItemToFavouritesEvent({
    required this.userId,
    required this.item,
  });
  @override
  List<Object> get props => [userId, item];
}
