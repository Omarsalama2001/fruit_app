import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(divide: 0.4),
      height: context.getHight(divide: 0.064),
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
