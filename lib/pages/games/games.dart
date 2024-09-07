import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/provider/games_model.dart';
import 'package:laruina/provider/single_game_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/appbar/search_app_bar.dart';
import 'package:laruina/widgets/games/game_tile_info.dart';
import 'package:laruina/widgets/tile/item_tile.dart';
import 'package:laruina/widgets/tile/tile_button.dart';
import 'package:provider/provider.dart';

class Games extends StatelessWidget {
  Games({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var gamesModel = context.read<GamesModel>();

    controller.addListener(
      () {
        gamesModel.filter(controller.text);
      },
    );
    return Scaffold(
      appBar: SearchAppBar(
        controller: controller,
        searched: false,
        hintText: "Search among the results",
      ),
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<GamesModel>(
          builder: (context, value, child) {
            if (value.filteredResult == null) {
              return Container();
            }

            return ListView(
              children: value.filteredResult!.games
                  .map(
                    (e) => ItemTile(
                      img: "https:${e.cover!}",
                      onTap: () =>
                              context.read<SingleGameModel>().get(e, context),
                      tileInfo: GameTileInfo(
                        game: e,
                      ),
                      buttons: [
                        if (!e.notCompletable)
                          ItemTileButton(
                              icon: FontAwesomeIcons.check,
                              enabled: e.completed,
                              action: () async {
                                if (e.completed) {
                                  gamesModel.uncompleteGame(context, e);
                                } else {
                                  gamesModel.completeGame(context, e);
                                }
                              }),
                        ItemTileButton(
                            icon: FontAwesomeIcons.heart,
                            enabled: e.prioritized,
                            action: () async {
                              if (e.prioritized) {
                                gamesModel.unpriotitize(context, e);
                              } else {
                                gamesModel.prioritize(context, e);
                              }
                            })
                      ],
                    ),
                  )
                  .toList(),
            );
          },
        ),
      )),
    );
  }
}
