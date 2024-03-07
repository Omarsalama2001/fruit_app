import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fruit_e_commerce/features/favourites/domain/use_cases/add_item_to_favourites_use_case.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  AddItemToFavouritesUseCase addItemToFavouritesUseCase;
  FavouritesBloc(
   {required this.addItemToFavouritesUseCase}
  ) : super(FavouritesInitial()) {
    on<FavouritesEvent>((event, emit) async{
      if (event is AddItemToFavouritesEvent) {
        emit(AddItemToFavouriteLoadingState());
        final faliureOrunit = await addItemToFavouritesUseCase(userId: event.userId, item: event.item);
        faliureOrunit.fold((l) => emit (AddItemToFavouriteErrorState(errorMessage: "something went wrong")), (r) => emit(AddItemToFavouriteSuccessState()));
      }
    });
  }
}
