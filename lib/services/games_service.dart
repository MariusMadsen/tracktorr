import 'package:flutter/foundation.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/http_service.dart';

class GamesService {
  GamesService._();
  static final String _baseUrl = HttpService.getBaseUrl("games");

  static String buildBanner(String url) {
    return "https:$url";
  }

  static Future<Game> getGame(String id) async {
    return HttpService.get(
      url: "$_baseUrl/games/$id",
      resp: (Map<String, dynamic> body) {
        return Game.fromJson(body);
      },
    );
  }

  static Future<GameResult> getOwnGames(GetGamesRequest request) async {
    return HttpService.post(
      url: "$_baseUrl/get",
      body: request,
      resp: (Map<String, dynamic> body) {
        var response = LaruinaResponse.fromJson(
            body, (data) => GameResult.fromJson(data as Map<String, dynamic>));
        if (response.success) {
          debugPrint(response.toString());

          debugPrint(response.data?.games.length.toString());
          return response.data;
        }
      },
    );
  }

  static Future<GameResult> searchGames(GetGamesRequest gamesRequest) async {
    if (gamesRequest == GetGamesRequest.clear()) {
      return Future<GameResult>.value(
          GameResult(games: [], platforms: [], genres: [], gameModes: []));
    }

    return HttpService.post(
      url: _baseUrl,
      body: gamesRequest,
      resp: (Map<String, dynamic> body) {
        var response = LaruinaResponse.fromJson(
            body, (data) => GameResult.fromJson(data as Map<String, dynamic>));
        if (response.success) {
          return response.data;
        }
      },
    );
  }

  Future<void> retrieveGames() {
    HttpService.get(url: "$_baseUrl/retrieve");
    return Future.value();
  }

  Future<List<FusionSuggestion>> getFusionGames(String platform) {
    return HttpService.get(
      url: "$_baseUrl/fuseSuggestions/$platform",
      resp: (List<dynamic> body) {
        return body.map((e) => FusionSuggestion.fromJson(e)).toList();
      },
    );
  }

  Future<void> fuseGames(FuseGameRequest request) {
    return HttpService.post(url: "$_baseUrl/fuseGames/", body: request);
  }

  Future<MissingGames> getMissingGames() {
    return HttpService.get(
      url: "$_baseUrl/missingGame",
      resp: (Map<String, dynamic> body) {
        return MissingGames.fromJson(body);
      },
    );
  }

  static Future<void> updatePersonal(UserGame personalGame) async {
    return HttpService.post(
        url: "$_baseUrl/updatePersonal",
        body: personalGame,
        error: "Could not update game");
  }

  Future<PlaystationUser> lookupPlaystationUser(String psnTag) async {
    return await HttpService.get(
      url: "$_baseUrl/playstation/profile/$psnTag/",
      resp: (Map<String, dynamic> body) {
        return PlaystationUser.fromJson(body);
      },
    );
  }

  Future<void> addPlaystationUser(PlaystationUser user) async {
    return await HttpService.post(
      url: "$_baseUrl/playstation/profile/",
      body: user,
    );
  }

  static Future<void> migrate() async {
    return await HttpService.post(url: "$_baseUrl/migrate");
  }
}
