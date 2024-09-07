// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameResult _$GameResultFromJson(Map<String, dynamic> json) => GameResult(
      games: (json['games'] as List<dynamic>)
          .map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
      platforms:
          (json['platforms'] as List<dynamic>).map((e) => e as String).toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      gameModes:
          (json['gameModes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GameResultToJson(GameResult instance) =>
    <String, dynamic>{
      'games': instance.games,
      'platforms': instance.platforms,
      'genres': instance.genres,
      'gameModes': instance.gameModes,
    };

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      name: json['name'] as String,
      id: json['id'] as String,
      steamIds:
          (json['steamIds'] as List<dynamic>).map((e) => e as String).toSet(),
      platforms:
          (json['platforms'] as List<dynamic>).map((e) => e as String).toList(),
      gameModes:
          (json['gameModes'] as List<dynamic>).map((e) => e as String).toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      cover: json['cover'] as String? ?? "",
      completed: json['completed'] as bool,
      prioritized: json['prioritized'] as bool,
      ownedPlatforms: (json['ownedPlatforms'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notCompletable: json['notCompletable'] as bool,
      releasedDate: json['releasedDate'] as String,
      owns: json['owns'] as bool,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'steamIds': instance.steamIds.toList(),
      'platforms': instance.platforms,
      'gameModes': instance.gameModes,
      'genres': instance.genres,
      'cover': instance.cover,
      'completed': instance.completed,
      'prioritized': instance.prioritized,
      'ownedPlatforms': instance.ownedPlatforms,
      'notCompletable': instance.notCompletable,
      'releasedDate': instance.releasedDate,
      'owns': instance.owns,
    };

AddGameRequest _$AddGameRequestFromJson(Map<String, dynamic> json) =>
    AddGameRequest(
      game: Game.fromJson(json['game'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddGameRequestToJson(AddGameRequest instance) =>
    <String, dynamic>{
      'game': instance.game,
    };

MissingGames _$MissingGamesFromJson(Map<String, dynamic> json) => MissingGames(
      playstation: Map<String, String>.from(json['playstation'] as Map),
      steam: Map<String, String>.from(json['steam'] as Map),
      xbox: Map<String, String>.from(json['xbox'] as Map),
    );

Map<String, dynamic> _$MissingGamesToJson(MissingGames instance) =>
    <String, dynamic>{
      'playstation': instance.playstation,
      'steam': instance.steam,
      'xbox': instance.xbox,
    };

GetGamesRequest _$GetGamesRequestFromJson(Map<String, dynamic> json) =>
    GetGamesRequest(
      searchField: json['searchField'] as String,
      filters: Map<String, bool>.from(json['filters'] as Map),
      friends:
          (json['friends'] as List<dynamic>).map((e) => e as String).toList(),
      steamOnly: json['steamOnly'] as bool,
    );

Map<String, dynamic> _$GetGamesRequestToJson(GetGamesRequest instance) =>
    <String, dynamic>{
      'searchField': instance.searchField,
      'filters': instance.filters,
      'friends': instance.friends,
      'steamOnly': instance.steamOnly,
    };

GetUpcomingGamesRequest _$GetUpcomingGamesRequestFromJson(
        Map<String, dynamic> json) =>
    GetUpcomingGamesRequest(
      platforms: (json['platforms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetUpcomingGamesRequestToJson(
        GetUpcomingGamesRequest instance) =>
    <String, dynamic>{
      'platforms': instance.platforms,
    };

UserGame _$UserGameFromJson(Map<String, dynamic> json) => UserGame(
      gameId: json['gameId'] as String,
      completed: json['completed'] as bool,
      prioritized: json['prioritized'] as bool,
      ownedPlatforms: (json['ownedPlatforms'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      owns: json['owns'] as bool,
    );

Map<String, dynamic> _$UserGameToJson(UserGame instance) => <String, dynamic>{
      'gameId': instance.gameId,
      'completed': instance.completed,
      'prioritized': instance.prioritized,
      'ownedPlatforms': instance.ownedPlatforms,
      'owns': instance.owns,
    };

FusionSuggestion _$FusionSuggestionFromJson(Map<String, dynamic> json) =>
    FusionSuggestion(
      newGame: FusionGame.fromJson(json['newGame'] as Map<String, dynamic>),
      igdbGames: (json['igdbGames'] as List<dynamic>)
          .map((e) => FusionGame.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FusionSuggestionToJson(FusionSuggestion instance) =>
    <String, dynamic>{
      'newGame': instance.newGame,
      'igdbGames': instance.igdbGames,
    };

FusionGame _$FusionGameFromJson(Map<String, dynamic> json) => FusionGame(
      id: json['id'] as String?,
      name: json['name'] as String,
      steamIds:
          (json['steamIds'] as List<dynamic>).map((e) => e as String).toSet(),
      xboxIds:
          (json['xboxIds'] as List<dynamic>).map((e) => e as String).toSet(),
      playstationIds: (json['playstationIds'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      gameModes:
          (json['gameModes'] as List<dynamic>).map((e) => e as String).toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      platforms:
          (json['platforms'] as List<dynamic>).map((e) => e as String).toList(),
      cover: json['cover'] as String?,
      notCompletable: json['notCompletable'] as bool,
      releaseYear: json['releaseYear'] as int?,
    );

Map<String, dynamic> _$FusionGameToJson(FusionGame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'steamIds': instance.steamIds.toList(),
      'xboxIds': instance.xboxIds.toList(),
      'playstationIds': instance.playstationIds.toList(),
      'gameModes': instance.gameModes,
      'genres': instance.genres,
      'platforms': instance.platforms,
      'cover': instance.cover,
      'notCompletable': instance.notCompletable,
      'releaseYear': instance.releaseYear,
    };

FuseGameRequest _$FuseGameRequestFromJson(Map<String, dynamic> json) =>
    FuseGameRequest(
      steamGame: FusionGame.fromJson(json['steamGame'] as Map<String, dynamic>),
      igdbGame: FusionGame.fromJson(json['igdbGame'] as Map<String, dynamic>),
      fusionType: json['fusionType'] as String,
    );

Map<String, dynamic> _$FuseGameRequestToJson(FuseGameRequest instance) =>
    <String, dynamic>{
      'steamGame': instance.steamGame,
      'igdbGame': instance.igdbGame,
      'fusionType': instance.fusionType,
    };
