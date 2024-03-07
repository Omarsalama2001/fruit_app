import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/widgets/authintication_text_form_feild.dart';
import 'package:fruit_e_commerce/core/widgets/main_button_widget.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';

 restetPasswordWidget(BuildContext context ,{required TextEditingController forogetPasswordController}) => showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Adjust the value as needed
            ),
            content: SizedBox(
              height: context.getDefaultSize() * 18,
              width: context.getDefaultSize() * 35,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Text("Reset Password", style: TextStyle(color: Colors.black, fontSize: 20)),
                SizedBox(
                  height: context.getDefaultSize(),
                ),
                CustomAuthTextForm(hinttext: "Email", mycontroller: forogetPasswordController, obscureText: false),
                SizedBox(
                  height: context.getDefaultSize() * 2,
                ),
                MainButtonWidget(
                    text: "Reset",
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(ResetPasswordEvent(email: forogetPasswordController.text));
                      forogetPasswordController.clear();
                      Navigator.pop(context);
                    })
              ]),
            ),
          ));