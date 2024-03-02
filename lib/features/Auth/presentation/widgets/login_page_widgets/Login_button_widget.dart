import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';

import 'package:fruit_e_commerce/core/utils/app_colors.dart';

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
    return SizedBox(
      width: context.getDefaultSize() * 30,
      height: context.getDefaultSize() * 4,
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.white,
        shape: BorderDirectional(
            start: BorderSide(
          width: 5.w,
          color: AppColors.secondColor,
        )),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
              height: context.getDefaultSize() * 3,
              width: context.getDefaultSize() * 3,
              child: Image.asset(
                iconPath,
              )),
          SizedBox(
            width: 8.sp,
          ),
          Text(
            "Log In With",
            style: TextStyle(fontSize: context.getDefaultSize() * 1.3),
          )
        ]),
      ),
    );
  }
}
