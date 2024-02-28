import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/widgets/cusom_header_text_widget.dart';
import 'package:fruit_e_commerce/core/widgets/loading_widget.dart';
import 'package:fruit_e_commerce/core/widgets/snack_bar.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/pages/login_form_page.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_page_widgets/Login_button_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/log_in_image.png'),
          SizedBox(
            height: context.getHight(divide: 0.05),
          ),
          const CustomHeaderTextWidget(
            text: "Fruit Market",
            color: AppColors.primaryColor,
            fontSize: 40,
          ),
          SizedBox(
            height: context.getHight(divide: 0.1),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                SnackBarMessage.showSnackBar(SnackBarTypes.SUCCESS, state.user.displayName!, context);
                
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginFormPage()),
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButtonWidget(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(const AuthLoginEvent(isGoogle: true));
                      },
                      iconPath: 'assets/icons/google_icon.png'),
                  SizedBox(
                    width: 15.sp,
                  ),
                  LoginButtonWidget(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(const AuthLoginEvent(isGoogle: false));
                      },
                      iconPath: 'assets/icons/facebook_icon.png'),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
