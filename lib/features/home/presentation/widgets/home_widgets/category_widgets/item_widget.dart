import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';
import 'package:fruit_e_commerce/core/widgets/favourite_icon_widget.dart';
import 'package:fruit_e_commerce/core/widgets/rating_bar_widget.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/details_page.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsPage(
                          item: item,
                        )));
          },
          child: SizedBox(
              height: SizeConfig.defaultSize! * 13,
              width: SizeConfig.defaultSize! * 10,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.01),
                      child: CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Center(child: Text("no image")),
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    top: SizeConfig.defaultSize! * 0.8,
                    right: SizeConfig.defaultSize!,
                    child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.defaultSize! * 2.3,
                        width: SizeConfig.defaultSize! * 2.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.5),
                          color: Colors.white,
                        ),
                        child: FavouriteIconWidget(
                          item: item,
                        )),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.5,
        ),
        RatingBarWidget(itemRate: item.rating),
        Text(
          item.name,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.3,
        ),
        Text(
          "EG ${item.price} per/kg",
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.3, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
