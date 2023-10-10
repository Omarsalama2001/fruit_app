import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/app_colors.dart';

import 'package:fruit_e_commerce/core/size_config.dart';

class TabBarWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final tabController;
  const TabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicator: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 0.5)),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: AppColors.tabsColor,
      labelStyle: TextStyle(fontSize: SizeConfig.screenHeight! * 0.023),
      labelPadding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 0.6, vertical: SizeConfig.screenHeight! * 0.011),
      tabs: const [
        Text(
          "Vegetables",
        ),
        Text(
          "Fruits",
        ),
        Text(
          "Dry fruits",
        ),
      ],
    );
  }
}
