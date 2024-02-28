import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';

class CustomTextFormWidget extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final bool isAddress;
  final TextEditingController controller;
  final String? Function(String? value) validate;

  const CustomTextFormWidget({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.isAddress,
    required this.controller,
     required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      minLines: 1,
      maxLines: isAddress ? 5 : 1,
      keyboardType: TextInputType.visiblePassword, // type of keyboard
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: AppColors.primaryColor,
        border: const OutlineInputBorder(), //amazing shape for TFF
        labelText: labelText,
      ),
    );
  }
}
