import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.hardEdge, alignment: Alignment.center, children: [
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
    ]);
  }
}
