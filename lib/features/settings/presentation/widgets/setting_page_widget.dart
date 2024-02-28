import 'package:flutter/material.dart';

import 'package:fruit_e_commerce/features/settings/presentation/widgets/setting_page_item.dart';

class SettingPageWidget extends StatelessWidget {
  const SettingPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Column(
            children: [
              SettingPageItem(
                icon: Icons.shopping_bag_sharp,
                settingName: "My Orders",
              ),
              SettingPageItem(icon: Icons.favorite, settingName: "Favorites"),
              SettingPageItem(
                icon: Icons.settings,
                settingName: "Settings",
              ),
              SettingPageItem(
                icon: Icons.shopping_cart,
                settingName: "My Cart",
              ),
              SettingPageItem(
                icon: Icons.help_outline,
                settingName: "Rate",
              ),
              SettingPageItem(icon: Icons.share_sharp, settingName: "Refer a freind"),
              SettingPageItem(icon: Icons.logout, settingName: "Logout"),
            ],
          )
        ],
      ),
    );
  }
}
