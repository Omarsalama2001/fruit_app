import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/sub_category_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/home_widgets/category_widgets/item_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.subCategory});
  final SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 1.5),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(subCategory.name, style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5, fontWeight: FontWeight.bold)),
            SizedBox(
              width: SizeConfig.defaultSize!,
            ),
            Text(
              "(${subCategory.discount}% Off)",
              style: TextStyle(color: AppColors.primaryColor, fontSize: SizeConfig.defaultSize! * 1.3, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(subCategory.title, style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.2)),
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 0.5,
        ),
        SizedBox(
            height: SizeConfig.defaultSize! * 20,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ItemWidget(item: subCategory.items[index]),
              itemCount: subCategory.items.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(width: SizeConfig.defaultSize! * 1.8),
            )),
      ]),
    );
  }
}
