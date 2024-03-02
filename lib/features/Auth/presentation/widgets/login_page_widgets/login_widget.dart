import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/styles/text_styles.dart';
import 'package:fruit_e_commerce/core/widgets/authintication_text_form_feild.dart';
import 'package:fruit_e_commerce/core/widgets/loading_widget.dart';
import 'package:fruit_e_commerce/core/widgets/main_button_widget.dart';
import 'package:fruit_e_commerce/core/widgets/snack_bar.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_page_widgets/Login_button_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();
  LoginWidget({super.key});

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
                    suffix: Icons.remove_red_eye,
                    hinttext: "Password",
                    mycontroller: passwordController,
                    obscureText: true,
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
                  child: TextButton(onPressed: () {}, child: Text('Forget Passsword?', style: TextStyle(color: Colors.black, fontSize: context.getDefaultSize() * 1.4))),
                ),
                SizedBox(
                  height: context.getDefaultSize() * 1.2,
                ),
                Center(
                    child: MainButtonWidget(
                        text: "Sign In",
                        onPressed: () {
                          if (formState.currentState!.validate()) {}
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
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        (route) => false,
                      );
                    } else if (state is AuthErrorState) {
                      SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, state.errorMessage, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const LoadingWidget();
                    }
                    return Column(
                      children: [
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
}
