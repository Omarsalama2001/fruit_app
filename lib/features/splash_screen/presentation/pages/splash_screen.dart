import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/pages/login_page.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:fruit_e_commerce/features/splash_screen/presentation/widgets/splashScreenWidget.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);
  final bool isLoggedIn;

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget.isLoggedIn ?  const LoginPage() : const OnBoardingPage()),
      
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primaryColor, body: _buildBody());
  }

  Widget _buildBody() {
    return const SplashScreenWidget();
  }
}
