import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';

buildVerificationAwesomeDialog(BuildContext context, {required TextEditingController emailController}) => AwesomeDialog(
        context: context,
        showCloseIcon: true,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Email not Verified',
        btnCancel: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        btnOk: TextButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(SendEmailVerificationEvent());
              Navigator.pop(context);
            },
            child: const Text('verify')),
        desc: 'send Verification email to ${emailController.text}',
      ).show();