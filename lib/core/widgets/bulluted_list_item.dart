import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';

class BullutedListItem extends StatelessWidget {
  const BullutedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("\u2022", style: TextStyle(fontSize: 40, color: AppColors.subTitleColor)),
        SizedBox(
          width: 5,
        ),
        Text(
          "Fibers",
          style: TextStyle(color: AppColors.subTitleColor, fontSize: 15),
        )
      ],
    );
  }
}
