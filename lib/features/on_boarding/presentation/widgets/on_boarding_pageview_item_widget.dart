import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';

class OnBoardingPageViewItemWidget extends StatelessWidget {
  const OnBoardingPageViewItemWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: context.getHight(divide: 0.4), child: Image.asset(image)),
      SizedBox(
        height: context.getHight(divide: 0.001),
      ),
      Text(
        title,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: context.getHight(divide: 0.01),
      ),
      Text(
        subtitle,
        style: TextStyle(fontSize: 15.sp, color: AppColors.subTitleColor),
      ),
    ]);
  }
}
