import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/widgets/cusom_header_text_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getDefaultSize() * 15,
      child: Stack(alignment: Alignment.topCenter, children: [
        Stack(alignment: Alignment.topCenter, children: [
          Container(
            color: AppColors.primaryColor,
            height: context.getDefaultSize() * 12,
            width: double.infinity,
          ),
          Positioned(
            top: context.getDefaultSize() * 4.5,
            left: context.getDefaultSize() * 2.5,
            child: CustomHeaderTextWidget(
              text: "Fruit Market",
              color: Colors.white,
              fontSize: context.getDefaultSize() * 3, // screen util made it bad :(
            ),
          ),
          Positioned(
            right: context.getDefaultSize() * 1.5,
            top: context.getDefaultSize() * 3,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: context.getDefaultSize() * 3.5,
                )),
          ),
        ]),
        Positioned(
            top: context.getDefaultSize() * 8.8,
            left: context.getDefaultSize() * 1.5,
            right: context.getDefaultSize() * 1.5,
            height: context.getDefaultSize() * 6,
            child: SearchBar(
              textStyle: MaterialStatePropertyAll(TextStyle(color: AppColors.subTitleColor, fontSize: context.getDefaultSize() * 1.5)),
              leading: Icon(Icons.search, color: AppColors.subTitleColor, size: context.getDefaultSize() * 3),
              hintText: "Search",
            ))
      ]),
    );
  }
}
