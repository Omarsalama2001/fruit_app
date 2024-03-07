import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/favourites/presentation/widgets/favourites_page_widget.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("My Favourites"),
        centerTitle: true,
      );
  Widget _buildBody() => const FavouritesPageWidget();
}
