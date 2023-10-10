import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/widgets/login_widget.dart';
import 'package:fruit_e_commerce/injectionContainer.dart' as di;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() => BlocProvider(
        create: (context) => di.sl<AuthBloc>(),
        child: const LoginWidget(),
      );
}
