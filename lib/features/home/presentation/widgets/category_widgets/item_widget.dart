import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_e_commerce/core/size_config.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: SizeConfig.defaultSize! * 12,
            width: SizeConfig.defaultSize! * 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(SizeConfig.screenWidth! * 0.8)),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/strawberry.png",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: SizeConfig.defaultSize! * 0.8,
                  right: SizeConfig.defaultSize!,
                  child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.defaultSize! * 2.3,
                    width: SizeConfig.defaultSize! * 2.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.4),
                      color: Colors.white,
                    ),
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
                  ),
                ),
              ],
            )),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.5,
        ),
        RatingBar.builder(itemSize: SizeConfig.defaultSize! * 1.5, glowColor: Colors.amber[2], itemCount: 5, updateOnDrag: true, initialRating: 3.5, allowHalfRating: true, itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber), onRatingUpdate: (rate) {}),
        Text(
          "Strawberry",
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.3,
        ),
        Text(
          "EG 300 per/kg",
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.3, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
