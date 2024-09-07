import 'package:flutter/material.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/pages/games/detailed_game_page.dart';
import 'package:laruina/provider/games_model.dart';
import 'package:laruina/services/games_service.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:provider/provider.dart';

class SingleGameModel extends ChangeNotifier {
  List<Game> selectedGame = [];

  void get(Game game, BuildContext context) async {
    selectedGame.add(game);
    notifyListeners();
    push(context);
  }

  void push(BuildContext context) async {
    debugPrint("creating pop callback");
    await Navigator.push(
      context,
      RouteAnimationService.createRoute(
        page: const DetailedGamePage(),
      ),
    ).whenComplete(() async {
      selectedGame.removeLast();
      if (selectedGame.isNotEmpty) {
        debugPrint("callback Done");
        debugPrint("Popping last detailed movie ${selectedGame.length}");
        await refresh(context);
        notifyListeners();
      }
    });
  }

  Future<bool> refresh(BuildContext context) async {
    await GamesService.getGame(selectedGame.last.id).then((value) {
      selectedGame.removeLast();
      selectedGame.add(value);
      return value;
    }).whenComplete(() => context.read<GamesModel>().refresh());
    notifyListeners();
    return true;
  }
}
