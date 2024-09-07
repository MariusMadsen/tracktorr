import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/pages/mtg/mtg_detailed_card_grid.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/services/mtg_service.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/appbar/search_app_bar.dart';
import 'package:laruina/widgets/tile/tile_button.dart';
import 'package:provider/provider.dart';

class MtgSetPage extends StatefulWidget {
  const MtgSetPage({super.key});

  @override
  State<MtgSetPage> createState() => _MtgSetPageState();
}

class _MtgSetPageState extends State<MtgSetPage> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
          controller: controller,
          searched: false,
          hintText: "Search among the results",
          onSearchSubmit: () {
            context.read<MtgModel>().filter(controller.text, "set");
          }),
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
              if (value.filteredResponse == null) {
                return const Text("Nothing!");
              }

              value.filteredResponse!.cards.sort(
                MtgService.sortCards,
              );

              return ListView(
                  controller: scrollController,
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    MtgDetailedGrid(
                        response: value.filteredResponse!,
                        viewContext: "printings",
                        page: page),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ItemTileButton(
                          icon: FontAwesomeIcons.arrowRight,
                          action: () {
                            debugPrint("I was clicked");
                            setState(() {
                              page = page + 1;
                              scrollController.animateTo(
                                scrollController.position.minScrollExtent,
                                duration: const Duration(seconds: 2),
                                curve: Curves.fastOutSlowIn,
                              );
                            });
                          },
                          enabled: true,
                        )
                      ],
                    )
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
