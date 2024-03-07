import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/strings/faliures.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/styles/text_styles.dart';
import 'package:fruit_e_commerce/core/widgets/authintication_text_form_feild.dart';
import 'package:fruit_e_commerce/core/widgets/loading_widget.dart';
import 'package:fruit_e_commerce/core/widgets/main_button_widget.dart';
import 'package:fruit_e_commerce/core/widgets/snack_bar.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_page_widgets/Login_button_widget.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_page_widgets/email_verification_dialog_widget.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_page_widgets/reset_password_dialog_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController forogetPasswordController = TextEditingController();

  final GlobalKey<FormState> formState = GlobalKey();

  bool isSuffixPressed = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.getDefaultSize()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: Styles.textStyle25,
                ),
                Text('Back!', style: Styles.textStyle25),
                SizedBox(
                  height: context.getDefaultSize(),
                ),
                Row(
                  children: [
                    Text(
                      'Sign in ',
                      style: Styles.textStyle17.copyWith(color: AppColors.primaryColor),
                    ),
                    Text('to your account', style: TextStyle(fontSize: context.getDefaultSize() * 1.8))
                  ],
                ),
                SizedBox(
                  height: context.getDefaultSize() * 5,
                ),
                CustomAuthTextForm(
                  hinttext: "Email",
                  mycontroller: emailController,
                  obscureText: false,
                  validator: (val) {
                    if (val == "") {
                      return "Email Can Not Be Empty ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: context.getDefaultSize(),
                ),
                CustomAuthTextForm(
                    suffix: isSuffixPressed ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                    suffixpressed: () {
                      setState(() {
                        isSuffixPressed = !isSuffixPressed;
                      });
                    },
                    hinttext: "Password",
                    mycontroller: passwordController,
                    obscureText: isSuffixPressed,
                    validator: (val) {
                      if (val == "") {
                        return "Password Can Not Be Empty ";
                      }
                      return null;
                    }),
                SizedBox(
                  height: context.getDefaultSize() * 1.2,
                ),
                Align(
                  alignment: FractionalOffset.centerRight,
                  child: TextButton(
                      onPressed: () {
                        restetPasswordWidget(context, forogetPasswordController: passwordController);
                      },
                      child: Text('Forget Passsword?', style: TextStyle(color: Colors.black, fontSize: context.getDefaultSize() * 1.4))),
                ),
                SizedBox(
                  height: context.getDefaultSize() * 1.2,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthErrorState) {
                      _mapAuthErrorStateToAction(state);
                    }
                    if (state is AuthSuccessState) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
                    }
                    if (state is SendVerificationOrResetEmailSuccessState) {
                      SnackBarMessage.showSnackBar(SnackBarTypes.SUCCESS, state.successMessage, context);
                    }
                    if (state is SendVerificationOrResetEmailErrorState) {
                      SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, state.errorMessage, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const Center(child: LoadingWidget());
                    }
                    return Column(
                      children: [
                        Center(
                            child: MainButtonWidget(
                                text: "Sign In",
                                onPressed: () {
                                  if (formState.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).add(AuthLoginWithEmailAndPassEvent(email: emailController.text, password: passwordController.text));
                                  }
                                })),
                        SizedBox(
                          height: context.getDefaultSize() * 1.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have account ?',
                              style: TextStyle(fontSize: context.getDefaultSize() * 1.4),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(color: AppColors.primaryColor, fontSize: context.getDefaultSize() * 1.4),
                                )),
                          ],
                        ),
                        Row(children: [
                          const Expanded(child: Divider()),
                          Text(
                            "OR",
                            style: TextStyle(color: AppColors.primaryColor, fontSize: context.getDefaultSize() * 1.4),
                          ),
                          const Expanded(child: Divider()),
                        ]),
                        SizedBox(
                          height: context.getDefaultSize() * 1.2,
                        ),
                        Center(
                          child: LoginButtonWidget(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(const AuthLoginEvent(isGoogle: true));
                              },
                              iconPath: 'assets/icons/google_icon.png'),
                        ),
                        SizedBox(
                          height: context.getDefaultSize() * 1.2,
                        ),
                        Center(
                          child: LoginButtonWidget(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(const AuthLoginEvent(isGoogle: false));
                              },
                              iconPath: 'assets/icons/facebook_icon.png'),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _mapAuthErrorStateToAction(AuthErrorState state) {
    switch (state.errorMessage) {
      case EMAIL_NOT_VERIFIED_MESSAGE:
        buildVerificationAwesomeDialog(context, emailController: emailController);
      case OFFLINE_Failure_MESSAGE:
        SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, OFFLINE_Failure_MESSAGE, context);
      case SERVER_Failure_MESSAGE:
        SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, SERVER_Failure_MESSAGE, context);
      case AUTH_Failure_MESSAGE:
        SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, AUTH_Failure_MESSAGE, context);
    }
  }
}
