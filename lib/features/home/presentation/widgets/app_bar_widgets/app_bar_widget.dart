import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/app_colors.dart';
import 'package:fruit_e_commerce/core/size_config.dart';
import 'package:fruit_e_commerce/core/widgets/cusom_header_text_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/app_bar_widgets/search_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.19,
      child: Stack(alignment: Alignment.topCenter, children: [
        Stack(alignment: Alignment.topCenter, children: [
          Container(
            color: AppColors.primaryColor,
            height: SizeConfig.screenHeight! * 0.15,
            width: double.infinity,
          ),
          Positioned(
            top: SizeConfig.screenHeight! * 0.05,
            left: SizeConfig.defaultSize! * 1.5,
            height: SizeConfig.screenHeight! * 0.1,
            child: CustomHeaderTextWidget(
              text: "Fruit Market",
              color: Colors.white,
              fontSize: SizeConfig.defaultSize! * 2.5, // screen util made it bad :(
            ),
          ),
          Positioned(
            right: SizeConfig.defaultSize! * 1.5,
            top: SizeConfig.screenHeight! * 0.03,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: SizeConfig.screenHeight! * 0.04,
                )),
          ),
        ]),
        const SearchWidget()
      ]),
    );
  }
}
