import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_form_widgets/text_form_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});
  final formKey = GlobalKey<FormState>();
  final phoneNumberTextController = TextEditingController();
  final addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "complete your info",
                style: TextStyle(fontSize: context.getHight(divide: 0.04), color: AppColors.primaryColor),
              ),
              SizedBox(height: context.getHight(divide: 0.05)),
              SizedBox(height: context.getHight(divide: 0.05)),
              CustomTextFormWidget(
                controller: phoneNumberTextController,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                labelText: "phone Number",
                icon: const Icon(Icons.phone),
                isAddress: false,
              ),
              SizedBox(height: context.getHight(divide: 0.05)),
              CustomTextFormWidget(
                controller: addressTextController,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                labelText: "Address",
                icon: const Icon(Icons.home),
                isAddress: true,
              ),
              SizedBox(height: context.getHight(divide: 0.05)),
              BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                if (state is AdditionalUserDataSuccessState) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                }
              }, builder: (context, state) {
                if (state is AdditionalUserDataLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthSaveAdditionalUserDataEvent(
                                adress: addressTextController.text,
                                phoneNumber: phoneNumberTextController.text,
                                fcmToken: await FirebaseMessaging.instance.getToken(),
                              ));
                            }
                          },
                          child: const Text("Submit")));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
/*
SizedBox(
                width: SizeConfig.defaultSize! * 100,
                height: SizeConfig.defaultSize! * 5,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: SizeConfig.defaultSize! * 2),
                    )),
              ),
              */