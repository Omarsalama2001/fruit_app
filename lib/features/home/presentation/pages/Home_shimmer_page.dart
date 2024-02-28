// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildShimerTaps(context),
            SizedBox(
              height: SizeConfig.defaultSize! * 1.5,
            ),
            SizedBox(height: context.getHight(divide: 1), child: ListView.separated(itemCount: 5, separatorBuilder: (context, index) => SizedBox(height: SizeConfig.defaultSize! * 1.5), itemBuilder: (context, index) => _buildShimmerItem(context))),
          ],
        ),
      ),
    );
  }

  _buildShimmerItem(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: SizeConfig.defaultSize! * 13,
              width: SizeConfig.defaultSize! * 10,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.01),
                      child: Container(
                        color: Colors.grey.shade300,
                      )),
                ],
              )),
          SizedBox(
            height: SizeConfig.defaultSize! * 0.5,
          ),
          Container(
            width: context.getDefaultSize() * 6,
            height: context.getDefaultSize() * 1,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.01),
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 0.5,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.01),
            ),
            width: context.getDefaultSize() * 4,
            height: context.getDefaultSize() * 1,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 0.3,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.01),
            ),
            width: context.getDefaultSize() * 8,
            height: context.getDefaultSize() * 1,
          )
        ],
      );
  _buildShimerTaps(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 0.5)),
              ),
              width: context.getDefaultSize() * 10,
              height: context.getDefaultSize() * 4,
            ),
            SizedBox(
              width: context.getDefaultSize(),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 0.5)),
              ),
              width: context.getDefaultSize() * 10,
              height: context.getDefaultSize() * 4,
            ),
            SizedBox(
              width: context.getDefaultSize(),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 0.5)),
              ),
              width: context.getDefaultSize() * 10,
              height: context.getDefaultSize() * 4,
            ),
          ],
        ),
      );
}
