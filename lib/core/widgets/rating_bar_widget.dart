import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:fruit_e_commerce/core/utils/size_config.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
    required this.itemRate,
  }) : super(key: key);

  final double itemRate;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(ignoreGestures: true, itemSize: SizeConfig.defaultSize! * 1.5, glowColor: Colors.amber[2], itemCount: 5, updateOnDrag: true, initialRating: itemRate, allowHalfRating: true, itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber), onRatingUpdate: (rate) {});
  }
}
