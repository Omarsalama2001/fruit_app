import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/app_colors.dart';
import 'package:fruit_e_commerce/core/size_config.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/category_widgets/item_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text("Organic Fruits", style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5, fontWeight: FontWeight.bold)),
            SizedBox(
              width: SizeConfig.defaultSize!,
            ),
            Text(
              "(20% Off)",
              style: TextStyle(color: AppColors.primaryColor, fontSize: SizeConfig.defaultSize! * 1.1, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text("Pick Up From organic farms", style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.1)),
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.5,
        ),
        const ItemWidget(),
      ]),
    );
  }
}
