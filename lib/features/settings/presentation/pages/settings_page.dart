import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/features/settings/presentation/widgets/setting_page_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        toolbarHeight: context.getDefaultSize() * 25,
        flexibleSpace: SizedBox(
          width: double.infinity,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Positioned.directional(
                end: context.getDefaultSize() * 2,
                top: context.getDefaultSize() * 5,
                textDirection: TextDirection.ltr,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                  iconSize: 25.h,
                )),
            Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: context.getDefaultSize() * 5.5,
                child: CircleAvatar(
                  radius: context.getDefaultSize() * 5,
                  backgroundImage: CachedNetworkImageProvider(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: TextStyle(fontSize: context.getDefaultSize() * 2.5, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(fontSize: context.getDefaultSize() * 2, color: Colors.white, fontWeight: FontWeight.w300),
              )
            ]),
          ]),
        ),
      );

  Widget _buildBody() => const SettingPageWidget();
}
