import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_page_widgets/login_widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() =>  LoginWidget();
}
