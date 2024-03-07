import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';
import 'package:fruit_e_commerce/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

class FavouriteIconWidget extends StatelessWidget {
  final Item item;
  const FavouriteIconWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<FavouritesBloc>(context).add(AddItemToFavouritesEvent(userId: FirebaseAuth.instance.currentUser!.uid, item: item));
      },
      child: Stack(clipBehavior: Clip.hardEdge, alignment: Alignment.center, children: [
        Icon(
          Icons.favorite,
          color: Colors.amber,
          size: SizeConfig.defaultSize! * 2,
        ),
        Icon(
          Icons.favorite,
          color: Colors.red,
          size: SizeConfig.defaultSize! * 1.7,
        ),
      ]),
    );
  }
}
