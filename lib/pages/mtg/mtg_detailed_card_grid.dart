import 'package:flutter/material.dart';
import 'package:laruina/contracts/mtg_contracts.dart';
import 'package:laruina/pages/mtg/mtg_card.dart';

class MtgDetailedGrid extends StatelessWidget {
  const MtgDetailedGrid(
      {super.key,
      required this.response,
      required this.viewContext,
      required this.page});

  final MtgResponse response;
  final String viewContext;
  final int page;

  @override
  Widget build(BuildContext context) {
    int count = (MediaQuery.of(context).size.width / 195).ceil();
    debugPrint(MediaQuery.of(context).size.toString());
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          mainAxisSpacing: 5,
          mainAxisExtent: 250 + 30,
          crossAxisSpacing: 10,
        ),
        itemCount: response.cards.length > page * 500
            ? 500
            : response.cards.length - (page - 1) * 500,
        itemBuilder: (BuildContext context, int index) {
          return MagicCard(
              card: response.cards[(page - 1) * 500 + index],
              viewContext: viewContext);
        });
  }
}
