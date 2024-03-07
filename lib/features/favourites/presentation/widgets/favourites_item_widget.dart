import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/styles/text_styles.dart';
import 'package:fruit_e_commerce/core/widgets/rating_bar_widget.dart';

class FavouritesItemWidget extends StatelessWidget {
  const FavouritesItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.h),
      child: Container(
        height: context.getDefaultSize() * 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0.h)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0.h,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0.h), bottomLeft: Radius.circular(10.0.h)),
                child: CachedNetworkImage(
                  imageUrl: "https://cdn.britannica.com/06/75906-050-16A53398/mango-fruits.jpg",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Center(child: Text("no image")),
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mango Fruits",
                    style: Styles.textStyle17.copyWith(fontSize: context.getDefaultSize() * 1.7),
                  ),
                  SizedBox(
                    height: context.getDefaultSize() * 0.5,
                  ),
                  Text(
                    "EG 50 per/kg",
                    style: TextStyle(fontSize: context.getDefaultSize() * 1.3, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: context.getDefaultSize() * 1.5,
                  ),
                  const RatingBarWidget(itemRate: 3.1),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: IconButton(
                  enableFeedback: true,
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: AppColors.secondColor,
                    size: context.getDefaultSize() * 3,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
