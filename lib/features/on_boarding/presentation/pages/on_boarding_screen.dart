import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/widgets/on_boarding_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() => BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: OnBoardingWidget(),
      );
}
