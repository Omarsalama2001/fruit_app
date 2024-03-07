
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/features/favourites/presentation/widgets/favourites_item_widget.dart';

class FavouritesPageWidget extends StatelessWidget {
  const FavouritesPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (_, index) => const FavouritesItemWidget(), separatorBuilder: (_, h) => SizedBox(height: 0.h), shrinkWrap: true, itemCount: 5);
  }
}
