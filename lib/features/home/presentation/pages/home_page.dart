import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() => const HomePageWidget();
}
