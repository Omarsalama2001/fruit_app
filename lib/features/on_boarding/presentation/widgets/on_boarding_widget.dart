import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/widgets/custom_skip_button_widget.dart';
import 'package:fruit_e_commerce/core/widgets/main_button_widget.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/pages/login_page.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/widgets/on_boarding_pageview_widet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(30.0.sp),
          child: CustomSkipButtonWidget(
              text: "Skip",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              }),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnBoardingPageViewWidget(pageController: pageController),
              SmoothPageIndicator(
                effect: WormEffect(activeDotColor: AppColors.primaryColor, paintStyle: PaintingStyle.stroke, radius: 2.sp, strokeWidth: 1.5.sp, spacing: 10.sp),
                controller: pageController,
                count: 3,
              ),
              SizedBox(
                height: context.getHight(divide: 0.1),
              ),
              BlocBuilder<OnBoardingCubit, OnBoardingState>(
                builder: (context, state) {
                  int pageNumber = 0;
                  if (state is OnBoardingPageChangedState) {
                    pageNumber = state.pageNumber;
                  }
                  return MainButtonWidget(
                    text: pageNumber != 2 ? "Next" : "Get Started",
                    onPressed: () {
                      if (pageNumber != 2) {
                        pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.linear);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
