import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/widgets/on_boarding_pageview_item_widget.dart';

// ignore: must_be_immutable
class OnBoardingPageViewWidget extends StatelessWidget {
  const OnBoardingPageViewWidget({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHight(divide: 0.5),
      width: double.infinity,
      child: PageView(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          BlocProvider.of<OnBoardingCubit>(context).changeOnBoardingPage(value);
        },
        children: const [OnBoardingPageViewItemWidget(image: 'assets/images/fisrt_on_boarding_image.png', title: "E shopping", subtitle: "Explore top organic fruits & grab them"), OnBoardingPageViewItemWidget(image: 'assets/images/second_on_boarding_image.png', title: "Delivery on the way", subtitle: "Get your order by speed delivery"), OnBoardingPageViewItemWidget(image: 'assets/images/third_on_boarding_image.png', title: "Delivery Arrived", subtitle: "Order is arrived at your place")],
      ),
    );
  }
}
