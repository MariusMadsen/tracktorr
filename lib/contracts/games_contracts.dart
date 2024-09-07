// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part "games_contracts.g.dart";

enum GamesContext { own, upcoming, search, all }

@JsonSerializable()
class GameResult {
  final List<Game> games;
  final List<String> platforms;
  final List<String> genres;
  final List<String> gameModes;
  GameResult({
    required this.games,
    required this.platforms,
    required this.genres,
    required this.gameModes,
  });

  @override
  int get hashCode {
    return games.hashCode ^
        platforms.hashCode ^
        genres.hashCode ^
        gameModes.hashCode;
  }

  factory GameResult.fromJson(Map<String, dynamic> json) =>
      _$GameResultFromJson(json);
  Map<String, dynamic> toJson() => _$GameResultToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameResult &&
        listEquals(other.games, games) &&
        listEquals(other.platforms, platforms) &&
        listEquals(other.genres, genres) &&
        listEquals(other.gameModes, gameModes);
  }

  GameResult copyWith({
    List<Game>? games,
    List<String>? platforms,
    List<String>? genres,
    List<String>? gameModes,
  }) {
    return GameResult(
      games: games ?? this.games,
      platforms: platforms ?? this.platforms,
      genres: genres ?? this.genres,
      gameModes: gameModes ?? this.gameModes,
    );
  }
}

@JsonSerializable()
class Game {
  final String name;
  final String id;
  final Set<String> steamIds;
  final List<String> platforms;
  final List<String> gameModes;
  final List<String> genres;
  final String? cover;
  final bool completed;
  final bool prioritized;
  final List<String> ownedPlatforms;
  final bool notCompletable;
  final String releasedDate;
  final bool owns;
  Game(
      {required this.name,
      required this.id,
      required this.steamIds,
      required this.platforms,
      required this.gameModes,
      required this.genres,
      this.cover = "",
      required this.completed,
      required this.prioritized,
      required this.ownedPlatforms,
      required this.notCompletable,
      required this.releasedDate,
      required this.owns});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}

@JsonSerializable()
class AddGameRequest {
  final Game game;
  AddGameRequest({
    required this.game,
  });

  factory AddGameRequest.fromJson(Map<String, dynamic> json) =>
      _$AddGameRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddGameRequestToJson(this);
}

@JsonSerializable()
class MissingGames {
  final Map<String, String> playstation;
  final Map<String, String> steam;
  final Map<String, String> xbox;
  MissingGames({
    required this.playstation,
    required this.steam,
    required this.xbox,
  });

  factory MissingGames.fromJson(Map<String, dynamic> json) =>
      _$MissingGamesFromJson(json);
  Map<String, dynamic> toJson() => _$MissingGamesToJson(this);
}

@JsonSerializable()
class GetGamesRequest {
  final String searchField;
  final Map<String, bool> filters;
  final List<String> friends;
  final bool steamOnly;
  GetGamesRequest({
    required this.searchField,
    required this.filters,
    required this.friends,
    required this.steamOnly,
  });

  static GetGamesRequest clear() {
    return GetGamesRequest(
        searchField: "", filters: {}, friends: [], steamOnly: false);
  }

  factory GetGamesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetGamesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetGamesRequestToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetGamesRequest &&
        other.searchField == searchField &&
        mapEquals(other.filters, filters) &&
        listEquals(other.friends, friends) &&
        other.steamOnly == steamOnly;
  }

  @override
  int get hashCode {
    return searchField.hashCode ^
        filters.hashCode ^
        friends.hashCode ^
        steamOnly.hashCode;
  }

  GetGamesRequest copyWith({
    String? searchField,
    Map<String, bool>? filters,
    List<String>? friends,
    bool? steamOnly,
  }) {
    return GetGamesRequest(
      searchField: searchField ?? this.searchField,
      filters: filters ?? this.filters,
      friends: friends ?? this.friends,
      steamOnly: steamOnly ?? this.steamOnly,
    );
  }

  @override
  String toString() {
    return 'GetGamesRequest(searchField: $searchField, filters: $filters, friends: $friends, steamOnly: $steamOnly)';
  }
}

@JsonSerializable()
class GetUpcomingGamesRequest {
  final List<String> platforms;
  GetUpcomingGamesRequest({
    this.platforms = const [],
  });

  factory GetUpcomingGamesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetUpcomingGamesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetUpcomingGamesRequestToJson(this);
}

@JsonSerializable()
class UserGame {
  final String gameId;
  final bool completed;
  final bool prioritized;
  final List<String> ownedPlatforms;
  final bool owns;
  UserGame(
      {required this.gameId,
      required this.completed,
      required this.prioritized,
      required this.ownedPlatforms,
      required this.owns});

  UserGame copyWith(
      {String? gameId,
      bool? completed,
      bool? prioritized,
      List<String>? ownedPlatforms,
      bool? owns}) {
    return UserGame(
        gameId: gameId ?? this.gameId,
        completed: completed ?? this.completed,
        prioritized: prioritized ?? this.prioritized,
        ownedPlatforms: ownedPlatforms ?? this.ownedPlatforms,
        owns: owns ?? this.owns);
  }

  factory UserGame.fromJson(Map<String, dynamic> json) =>
      _$UserGameFromJson(json);
  Map<String, dynamic> toJson() => _$UserGameToJson(this);
}

@JsonSerializable()
class FusionSuggestion {
  final FusionGame newGame;
  final List<FusionGame> igdbGames;
  FusionSuggestion({
    required this.newGame,
    required this.igdbGames,
  });

  factory FusionSuggestion.fromJson(Map<String, dynamic> json) =>
      _$FusionSuggestionFromJson(json);
  Map<String, dynamic> toJson() => _$FusionSuggestionToJson(this);
}

@JsonSerializable()
class FusionGame {
  final String? id;
  final String name;
  final Set<String> steamIds;
  final Set<String> xboxIds;
  final Set<String> playstationIds;
  final List<String> gameModes;
  final List<String> genres;
  final List<String> platforms;
  final String? cover;
  bool notCompletable = false;
  final int? releaseYear;
  FusionGame({
    this.id,
    required this.name,
    required this.steamIds,
    required this.xboxIds,
    required this.playstationIds,
    required this.gameModes,
    required this.genres,
    required this.platforms,
    this.cover,
    required this.notCompletable,
    this.releaseYear,
  });

  factory FusionGame.fromJson(Map<String, dynamic> json) =>
      _$FusionGameFromJson(json);
  Map<String, dynamic> toJson() => _$FusionGameToJson(this);
}

@JsonSerializable()
class FuseGameRequest {
  final FusionGame steamGame;
  final FusionGame igdbGame;
  final String fusionType;
  FuseGameRequest({
    required this.steamGame,
    required this.igdbGame,
    required this.fusionType,
  });

  factory FuseGameRequest.fromJson(Map<String, dynamic> json) =>
      _$FuseGameRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FuseGameRequestToJson(this);
}

enum GameCompleted { COMPLETED, NOTCOMPLETED, BOTH }

enum GamePrioritized { PRIORITIZED, NOTPRIORITIZED, BOTH }
