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
      width: context.getDefaultSize() * 20,
      height: context.getDefaultSize() * 5,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: context.getDefaultSize() * 1.8),
          )),
    );
  }
}
