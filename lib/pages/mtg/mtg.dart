import 'package:flutter/material.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:provider/provider.dart';

class Mtg extends StatelessWidget {
  const Mtg({super.key});

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
              if (value.response == null) {
                return const Text("Nothing!");
              }
        
              debugPrint("Search for mtg cards returned: ${value.response!.cards}");
              return ListView(
                shrinkWrap: true,
                children: [
                  GridView.count(
                    padding: const EdgeInsets.all(8),
                    childAspectRatio: 1 / 1.66,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: value.response!.cards
                        .map((e) => GestureDetector(
                              onTap: () {
                                debugPrint("SEACHING ${e.oracleId}");
                                context
                                    .read<MtgModel>()
                                    .searchPrintings(e, context);
                              },
                              child: Container(
                                color: const Color.fromARGB(0, 184, 22, 22),
                                child: Image.network(
                                  e.img,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
