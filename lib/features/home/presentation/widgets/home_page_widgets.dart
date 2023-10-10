import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/size_config.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/app_bar_widgets/app_bar_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/category_widgets/category_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/tap_bar_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const AppBarWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.9),
                  child: TabBarWidget(tabController: tabController),
                ),
                Container(height: 500, child: TabBarView(controller: tabController, children: const [CategoryWidget(), CategoryWidget(), CategoryWidget()]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
Positioned(
                                  top: SizeConfig.defaultSize! * 0.8,
                                  right: SizeConfig.defaultSize!,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                    ),
                                    child: const
                                     Stack
                                     (alignment: Alignment.center, children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.amber,
                                        size: 22,
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ]),
                                  ),
                                ),
                                */