import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/extensions/media_query_extension.dart';
import 'package:fruit_e_commerce/core/utils/size_config.dart';
import 'package:fruit_e_commerce/core/widgets/bulluted_list_item.dart';
import 'package:fruit_e_commerce/core/widgets/cusom_header_text_widget.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.screenHeight! * 0.9,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  expandedHeight: context.getHight(divide: 0.3),
                  title: Text(item.name),
                  pinned: true,
                  centerTitle: true,
                  floating: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(SizeConfig.defaultSize! * 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.description,
                        style: TextStyle(color: Colors.white, fontSize: SizeConfig.defaultSize! * 1.5, overflow: TextOverflow.ellipsis),
                        maxLines: 4,
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                      child: Image(
                        image: NetworkImage(item.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeaderTextWidget(text: "Nutrations", color: Colors.black, fontSize: SizeConfig.defaultSize! * 2.5),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 1.5,
                      ),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                      BullutedListItem(),
                    ],
                  ),
                ),
              ])),
            ],
          ),
        ),
        Spacer(),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text("EG ${item.price} per killo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.defaultSize! * 2))),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: SizeConfig.screenHeight! * 0.06,
                    width: SizeConfig.defaultSize! * 0.4,
                    child: ElevatedButton(onPressed: () {}, child: const Text("Add To Cart")),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
/*
SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 22,
                width: SizeConfig.defaultSize! * 100,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  child: Image.network(item.imageUrl, fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              CustomHeaderTextWidget(text: item.name, color: Colors.black, fontSize: SizeConfig.defaultSize! * 2.5),
              Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize!),
                child: Text(
                  item.description,
                  style: TextStyle(color: AppColors.subTitleColor, height: SizeConfig.defaultSize! * 0.135),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CustomHeaderTextWidget(text: "Nutrations", color: Colors.black, fontSize: SizeConfig.defaultSize! * 2.5),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => const BullutedListItem(),
                  itemCount: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: Text("EG ${item.price} per killo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.defaultSize! * 2))),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: SizeConfig.screenHeight! * 0.06,
                        width: SizeConfig.defaultSize! * 0.4,
                        child: ElevatedButton(onPressed: () {}, child: const Text("Add To Cart")),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
*/