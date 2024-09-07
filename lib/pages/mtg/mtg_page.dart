import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/search_content.dart';
import 'package:laruina/widgets/common/context_selector.dart';
import 'package:provider/provider.dart';

class MtgPage extends StatelessWidget {
  MtgPage({super.key});

  final TextEditingController searchMtgCardController = TextEditingController();

  void search(MtgModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.search(searchMtgCardController.text, context);
  }

  void getOwnCards(MtgModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    model.getOwnCards(context);
  }

  void getSets(MtgModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    model.getSets(context);
  }

  void clear(MoviesModel model) {
    searchMtgCardController.clear();
    model.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mtgModel = context.read<MtgModel>();

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
          child: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 225,
                ),
                SearchContent(
                  searchController: searchMtgCardController,
                  search: () => search(mtgModel, context),
                  hintText: "Search for any mtg card",
                ),
                const SizedBox(
                  height: 30,
                ),
                ContextSelector(
                    action: () =>
                        getOwnCards(context.read<MtgModel>(), context),
                    actionName: "See own cards",
                    actionIcon: FontAwesomeIcons.eye),
                ContextSelector(
                    action: () => getSets(context.read<MtgModel>(), context),
                    actionName: "See sets",
                    actionIcon: FontAwesomeIcons.boxesStacked),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
