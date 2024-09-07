import 'package:flutter/material.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/pages/games/games.dart';
import 'package:laruina/services/games_service.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/route_animation_service.dart';

class GamesModel extends ChangeNotifier {
  GameResult? gameResult;
  GameResult? filteredResult;
  String _text = "";
  Function reGet = () {}; // Store the latest function used to refetch from BE

  void filter(String text) {
    if (gameResult == null) {
      debugPrint("No results");
      return;
    }
    debugPrint("Size: ${gameResult!.games.length}");
    _text = text; // Set text incase of refetch
    filteredResult = gameResult!.copyWith(
        games: gameResult!.games
            .where((element) =>
                element.name.toLowerCase().contains(_text.toLowerCase()))
            .toList());
    notifyListeners();
    debugPrint("Inner searched yielded ${filteredResult!.games.length}");
  }

  void search(String title, BuildContext context, {newPage = true}) async {
    Loader.load(context);

    gameResult = await GamesService.searchGames(GetGamesRequest(
            searchField: title, filters: {}, friends: [], steamOnly: false))
        .whenComplete(() => renderComplete(context, newPage));

    filter(_text);
  }

  void getOwnGames(BuildContext context, {newPage = true}) async {
    Loader.load(context);
    reGet = () => getOwnGames(context, newPage: false);

    gameResult = await GamesService.getOwnGames(GetGamesRequest(
            searchField: "", filters: {}, friends: [], steamOnly: false))
        .whenComplete(() => renderComplete(context, newPage));

    filter(_text);
  }

  void uncompleteGame(BuildContext context, Game game) async {
    Loader.load(context);
    if (!game.completed) {
      return;
    }
    UserGame userGame = UserGame(
        gameId: game.id,
        completed: false,
        prioritized: game.prioritized,
        ownedPlatforms: game.ownedPlatforms,
        owns: game.owns);
    await GamesService.updatePersonal(userGame)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  void completeGame(BuildContext context, Game game) async {
    Loader.load(context);
    if (game.completed) {
      return;
    }
    UserGame userGame = UserGame(
        gameId: game.id,
        completed: true,
        prioritized: game.prioritized,
        ownedPlatforms: game.ownedPlatforms,
        owns: game.owns);
    await GamesService.updatePersonal(userGame)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  void unpriotitize(BuildContext context, Game game) async {
    Loader.load(context);
    if (!game.prioritized) {
      return;
    }
    UserGame userGame = UserGame(
        gameId: game.id,
        completed: game.completed,
        prioritized: false,
        ownedPlatforms: game.ownedPlatforms,
        owns: game.owns);
    await GamesService.updatePersonal(userGame)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  void prioritize(BuildContext context, Game game) async {
    Loader.load(context);
    if (game.prioritized) {
      return;
    }
    UserGame userGame = UserGame(
        gameId: game.id,
        completed: game.completed,
        prioritized: true,
        ownedPlatforms: game.ownedPlatforms,
        owns: game.owns);
    await GamesService.updatePersonal(userGame)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  void disown(BuildContext context, Game game) async {
    Loader.load(context);
    if (!game.prioritized) {
      return;
    }
    UserGame userGame = UserGame(
        gameId: game.id,
        completed: game.completed,
        prioritized: game.prioritized,
        ownedPlatforms: game.ownedPlatforms,
        owns: false);
    await GamesService.updatePersonal(userGame)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  void own(BuildContext context, Game game) async {
    Loader.load(context);
    if (game.prioritized) {
      return;
    }
    UserGame userGame = UserGame(
        gameId: game.id,
        completed: game.completed,
        prioritized: game.prioritized,
        ownedPlatforms: game.ownedPlatforms,
        owns: true);
    await GamesService.updatePersonal(userGame)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  void renderComplete(BuildContext context, bool newPage) {
    notifyListeners();
    Loader.loadComplete(context);
    if (newPage) {
      _text = "";
      filter(_text);
      navigateToGames(context);
    }
  }

  void navigateToGames(BuildContext context) {
    Navigator.of(context)
        // ignore: prefer_const_constructors
        .push(RouteAnimationService.createRoute(
            page: Games(),
            offset: const Offset(0.0, 1.0),
            duration: const Duration(milliseconds: 1250)));
  }

  Future<bool> refresh() async {
    reGet();
    filter(_text);
    notifyListeners();
    return true;
  }
}
