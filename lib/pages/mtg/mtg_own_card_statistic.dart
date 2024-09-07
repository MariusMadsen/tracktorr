import 'package:flutter/material.dart';
import 'package:laruina/contracts/mtg_contracts.dart';

class MtgOwnStatistic extends StatelessWidget {
  const MtgOwnStatistic({super.key, required this.response});

  final MtgResponse response;

  @override
  Widget build(BuildContext context) {
    response.setStatistics!.sort(
      (a, b) => a.setId.compareTo(b.setId),
    );
    var width = MediaQuery.of(context).size.width;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Text("Total cards: ${response.totalCards}"),
        Text("Total value: ${response.totalValue!.toStringAsFixed(2)}\$"),
        ExpansionTile(
          title: const Text("See more"),
          children: response.setStatistics!.map((e) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 8,
                    child: Text(e.setId),
                  ),
                  SizedBox(
                    width: width / 4,
                    child: Text("${e.cards} Cards"),
                  ),
                  SizedBox(
                    width: width / 4,
                    child: Text("${e.totalValue.toStringAsFixed(2)}\$"),
                  ),
                  SizedBox(
                    width: width / 4,
                    child: Text("${e.pricePerCard.toStringAsFixed(2)} cards\$"),
                  )
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
