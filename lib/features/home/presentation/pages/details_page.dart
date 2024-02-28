import 'package:flutter/material.dart';

import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/widgets/details_widgets/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() => DetailsWidget(item: item);
}
