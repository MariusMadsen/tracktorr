import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/provider/games_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/context_selector.dart';
import 'package:laruina/widgets/common/search_content.dart';
import 'package:provider/provider.dart';

class GamesPage extends StatelessWidget {
  GamesPage({super.key});

  final TextEditingController searchGameController = TextEditingController();

  void search(GamesModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.search(searchGameController.text, context);
  }

  void getOwnComics(GamesModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    model.getOwnGames(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 225,
              ),
              SearchContent(
                searchController: searchGameController,
                search: () => search(context.read<GamesModel>(), context),
                hintText: "Search for any game",
              ),
              const SizedBox(
                height: 30,
              ),
              ContextSelector(
                  action: () =>
                      getOwnComics(context.read<GamesModel>(), context),
                  actionName: "See own games",
                  actionIcon: FontAwesomeIcons.eye),
              // ContextSelector(
              //     action: () => getOwnFinishedComics(
              //         context.read<ComicsModel>(), context),
              //     actionName: "See finished comics",
              //     actionIcon: FontAwesomeIcons.check),
              // ContextSelector(
              //     action: () => getOwnUnstartedComics(
              //         context.read<ComicsModel>(), context),
              //     actionName: "See unstarted comics",
              //     actionIcon: FontAwesomeIcons.bookmark),
              // ContextSelector(
              //     action: () => getOrder(context.read<ComicsModel>(), context),
              //     actionName: "See comic orders",
              //     actionIcon: FontAwesomeIcons.listUl),
            ],
          ),
        ),
      ),
    );
  }
}
