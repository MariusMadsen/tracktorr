import 'package:flutter/material.dart';
import 'package:laruina/contracts/mtg_contracts.dart';
import 'package:laruina/pages/mtg/mtg_detailed_card_grid.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/services/mtg_service.dart';
import 'package:laruina/statics/colors.dart';
import 'package:provider/provider.dart';

class MtgPrintings extends StatelessWidget {
  const MtgPrintings({super.key});

  String getText(MtgCard e) {
    String text = "";
    if (e.showcase) {
      text += "Showcase ";
    }
    if (e.texture) {
      text += "Textured ";
    }
    if (e.etched) {
      text += "Etched ";
    }
    if (e.extended) {
      text += "Extended ";
    }
    if (e.foil) {
      text += "Foiled ";
    }
    if (text == "") {
      text += "Normal ";
    }
    text += "${e.price}\$";

    text = "${e.collectorNumber}: $text";
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Swiping in right direction.
          debugPrint(details.delta.dx.toString());
          if (details.delta.dx > 8) {
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          child: Consumer<MtgModel>(
            builder: (context, value, child) {
              if (value.printsResponse == null) {
                return const Text("Nothing!");
              }

              value.printsResponse!.cards.sort(MtgService.sortCards);

              return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    MtgDetailedGrid(
                      response: value.printsResponse!,
                      viewContext: "printings",
                      page: 1,
                    )
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
