import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';

class SettingPageItem extends StatelessWidget {
  const SettingPageItem({super.key, required this.icon, required this.settingName, this.ontap});
  final IconData icon;
  final String settingName;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Padding(
            padding: EdgeInsets.all(context.getDefaultSize() * 0.5),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primaryColor, size: context.getDefaultSize() * 4),
                SizedBox(width: 10.sp),
                Text(
                  settingName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: AppColors.subTitleColor,
        )
      ],
    );
  }
}
