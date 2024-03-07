import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/Home_shimmer_page.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/home_widgets/app_bar_widgets/app_bar_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/home_widgets/category_widgets/category_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/home_widgets/tap_bar_widget.dart';

import '../../blocs/bloc/home_bloc.dart';

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
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeErrorState && state.failure.runtimeType == ConnectionFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(days: 365),
                      content: Text("state.Failure.FailureName"),
                      action: SnackBarAction(
                        label: "Retry",
                        onPressed: (() {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          BlocProvider.of<HomeBloc>(context).add(GetAllCategoriesEvent());
                        }),
                      )));
                }
              },
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const HomePageShimmer();
                } else if (state is HomeSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.9),
                        child: TabBarWidget(tabController: tabController, categories: state.categories),
                      ),
                      SizedBox(
                          height: SizeConfig.screenHeight!,
                          child: TabBarView(controller: tabController, children: [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(height: SizeConfig.defaultSize! * 1.5),
                              itemBuilder: (context, index) => CategoryWidget(subCategory: state.categories[0].subCategories[index]),
                              itemCount: state.categories[0].subCategories.length,
                            ),
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(height: SizeConfig.defaultSize! * 1.5),
                              itemBuilder: (context, index) => CategoryWidget(subCategory: state.categories[1].subCategories[index]),
                              itemCount: state.categories[1].subCategories.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) => CategoryWidget(subCategory: state.categories[2].subCategories[index]),
                              itemCount: state.categories[2].subCategories.length,
                            ),
                          ]))
                    ],
                  );
                } else if (state is HomeErrorState && state.failure.runtimeType == ConnectionFailure) {
                  return Center(
                    child: Image.asset("assets/images/No connection_image.png"),
                  );
                } else {
                  return Center(child: Image.asset("assets/images/server_Error.png"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
