import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';

class CustomAuthTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final IconData? suffix;
  final VoidCallback? suffixpressed;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomAuthTextForm({
    super.key,
    required this.hinttext,
    required this.mycontroller,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.suffix,
    this.suffixpressed,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: TextStyle(fontSize: context.getDefaultSize() * 1.4),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator,
        controller: mycontroller,

        ///see it again
        decoration: InputDecoration(
          // you should put this to mke border fixed when you click on the button
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixpressed,
                  icon: Icon(suffix),
                )
              : null,
          hintText: hinttext,
          contentPadding: EdgeInsets.all(context.getDefaultSize()),
          enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.black)),

          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              )),
        ),
      ),
    );
  }
}
