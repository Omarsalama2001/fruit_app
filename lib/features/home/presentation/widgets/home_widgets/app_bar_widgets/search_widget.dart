/*
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Positioned(
        top: SizeConfig.screenHeight! * 0.11,
        left: SizeConfig.defaultSize! * 1.5,
        right: SizeConfig.defaultSize! * 1.5,
        height: SizeConfig.screenHeight! * 0.07,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x2F000000),
                blurRadius: 18,
                offset: Offset(0, 3),
                spreadRadius: 3,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search, size: SizeConfig.defaultSize! * 2.5, color: const Color(0xffC3C3C3)),
              SizedBox(
                width: SizeConfig.defaultSize,
              ),
              Text("Search", style: TextStyle(fontSize: SizeConfig.defaultSize! * 2, color: const Color(0xffC3C3C3))),
            ],
          ),
        ),
      ),
    );
  }
}
*/