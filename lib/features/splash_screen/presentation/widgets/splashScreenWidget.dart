import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/widgets/cusom_header_text_widget.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      const CustomHeaderTextWidget(
        text: "Fruit Market",
        color: Colors.white,
        fontSize: 40,
      ),
      Container(
        width: double.infinity,
        height: context.getHight(divide: 0.5),
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splash_screen_image.png'), fit: BoxFit.cover)),
      )
    ]);
  }
}
