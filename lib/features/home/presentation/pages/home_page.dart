import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/features/favourites/presentation/pages/favourite_page.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/home_widgets/home_page_widget.dart';
import 'package:fruit_e_commerce/features/settings/presentation/pages/settings_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavigationIndex = 0;
  List<Widget> bottomNavigationPages = const [
    HomePageWidget(),
    FavouritesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: FlashyTabBar(
          height: 55,
          animationCurve: Curves.bounceIn,
          selectedIndex: _bottomNavigationIndex,
          iconSize: 30,
          items: [FlashyTabBarItem(activeColor: AppColors.secondColor, inactiveColor: AppColors.primaryColor, icon: const Icon(Icons.home), title: const Text("Home")), FlashyTabBarItem(activeColor: AppColors.secondColor, inactiveColor: AppColors.primaryColor, icon: const Icon(Icons.favorite), title: const Text("Favourite")), FlashyTabBarItem(activeColor: AppColors.secondColor, inactiveColor: AppColors.primaryColor, icon: const Icon(Icons.settings), title: const Text("Settings"))],
          onItemSelected: (value) {
            setState(() {
              _bottomNavigationIndex = value;
            });
          },
          showElevation: true,
        ));
  }

  Widget _buildBody() => bottomNavigationPages[_bottomNavigationIndex];
}
