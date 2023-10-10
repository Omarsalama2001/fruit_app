import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruit_e_commerce/core/app_colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    Key? key,
    required this.onPressed,
    required this.iconPath,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      shape: const BorderDirectional(
          start: BorderSide(
        width: 5,
        color: AppColors.secondColor,
      )),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(iconPath),
        SizedBox(
          width: 8.sp,
        ),
        const Text("Log In With")
      ]),
    );
  }
}
