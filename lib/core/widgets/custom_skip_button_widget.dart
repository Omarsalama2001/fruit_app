import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/app_colors.dart';

class CustomSkipButtonWidget extends StatelessWidget {
  const CustomSkipButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 13.sp, color: AppColors.subTitleColor),
      ),
    );
  }
}
