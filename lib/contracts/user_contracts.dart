import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part "user_contracts.g.dart";

// dart run build_runner build --delete-conflicting-outputs
class UserLogin {
  final String email;
  final String password;

  UserLogin({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLogin.fromJson(String source) =>
      UserLogin.fromMap(json.decode(source));

  @override
  String toString() => 'UserLogin(email: $email, password: $password)';
}

// ignore_for_file: constant_identifier_names

enum Gender { MALE, FEMALE, TBA }

@JsonSerializable()
class User {
  final String email;
  final String id;
  final String username;
  final String firstName;
  final String middleName;
  final String lastName;
  final Gender gender;
  final String steamId;
  final XboxUser xboxUser;
  final PlaystationUser playstationUser;
  final String spotifyCode;
  final bool admin;
  User({
    required this.email,
    required this.id,
    required this.username,
    required this.firstName,
    this.middleName = "",
    required this.lastName,
    required this.gender,
    this.steamId = "",
    this.xboxUser = const XboxUser(
        xboxId: "", gamertag: "", realName: "", profilePicture: ""),
    this.playstationUser =
        const PlaystationUser(playstationId: "", username: "", img: ""),
    this.spotifyCode = "",
    this.admin = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return id;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.id == id &&
        other.username == username &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        id.hashCode ^
        username.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        gender.hashCode ^
        steamId.hashCode ^
        xboxUser.hashCode ^
        playstationUser.hashCode ^
        spotifyCode.hashCode ^
        admin.hashCode;
  }
}

@JsonSerializable()
class XboxUser {
  final String xboxId;
  final String gamertag;
  final String realName;
  final String profilePicture;

  const XboxUser({
    this.xboxId = "",
    this.gamertag = "",
    this.realName = "",
    this.profilePicture = "",
  });

  factory XboxUser.fromJson(Map<String, dynamic> json) =>
      _$XboxUserFromJson(json);
  Map<String, dynamic> toJson() => _$XboxUserToJson(this);
}

@JsonSerializable()
class PlaystationUser {
  final String playstationId;
  final String username;
  final String img;
  const PlaystationUser({
    required this.playstationId,
    required this.username,
    required this.img,
  });

  factory PlaystationUser.fromJson(Map<String, dynamic> json) =>
      _$PlaystationUserFromJson(json);
  Map<String, dynamic> toJson() => _$PlaystationUserToJson(this);
}

@JsonSerializable()
class Friend {
  final String id;
  final String username;
  Friend({
    required this.id,
    required this.username,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  Map<String, dynamic> toJson() => _$FriendToJson(this);

  @override
  String toString() => username;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Friend && other.id == id && other.username == username;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode;
}

@JsonSerializable()
class UserFriends {
  final Set<Friend> friends;
  final Set<Friend> friendRequests;
  UserFriends({
    required this.friends,
    required this.friendRequests,
  });

  factory UserFriends.fromJson(Map<String, dynamic> json) =>
      _$UserFriendsFromJson(json);
  Map<String, dynamic> toJson() => _$UserFriendsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserFriends &&
        setEquals(other.friends, friends) &&
        setEquals(other.friendRequests, friendRequests);
  }

  @override
  int get hashCode => friends.hashCode ^ friendRequests.hashCode;
}

@JsonSerializable()
class AuthResponse {
  final String jwt;
  final String refreshToken;
  final User user;
  final int ttl;
  AuthResponse({
    required this.jwt,
    required this.refreshToken,
    required this.user,
    required this.ttl,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AddFriendRequest {
  final String friendId;
  AddFriendRequest({
    required this.friendId,
  });

  factory AddFriendRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFriendRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddFriendRequestToJson(this);
}

@JsonSerializable()
class UserStats {
  final List<Statistic> statistics;
  UserStats({
    required this.statistics,
  });
  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatsToJson(this);

  @override
  String toString() => 'UserStats(statistics: $statistics)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserStats && listEquals(other.statistics, statistics);
  }

  @override
  int get hashCode => statistics.hashCode;
}

@JsonSerializable()
class Statistic {
  final StatisticType statType;
  final int amount;
  Statistic({
    required this.statType,
    required this.amount,
  });
  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticToJson(this);

  @override
  String toString() => 'Statistic(statType: $statType, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Statistic &&
        other.statType == statType &&
        other.amount == amount;
  }

  @override
  int get hashCode => statType.hashCode ^ amount.hashCode;
}

@JsonSerializable()
class RegisterNewUser {
  final String email;
  RegisterNewUser({
    required this.email,
  });

  factory RegisterNewUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterNewUserFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterNewUserToJson(this);
}

class UserProviderResponse {
  final User user;
  final bool loading;
  final String timestamp;
  UserProviderResponse({
    required this.user,
    required this.loading,
    required this.timestamp,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProviderResponse && other.user == user;
  }

  @override
  int get hashCode => user.hashCode ^ loading.hashCode ^ timestamp.hashCode;
}

class StatsProviderResponse {
  final UserStats? userStats;
  final bool loading;

  StatsProviderResponse({
    this.userStats,
    required this.loading,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatsProviderResponse &&
        other.userStats == userStats &&
        other.loading == loading;
  }

  @override
  int get hashCode => userStats.hashCode ^ loading.hashCode;
}

@JsonSerializable(genericArgumentFactories: true)
class LaruinaResponse<T> {
  final bool success;
  final bool clientHasLatest;
  String? message;
  T? data;

  LaruinaResponse(
      {required this.success,
      required this.clientHasLatest,
      this.message,
      this.data});

  factory LaruinaResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$LaruinaResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$LaruinaResponseToJson(this, toJsonT);

  @override
  String toString() {
    return 'LaruinaResponse(success: $success, clientHasLatest: $clientHasLatest, message: $message, data: $data)';
  }
}

@JsonSerializable()
class RefreshRequest {
  final String refreshToken;
  RefreshRequest({required this.refreshToken});

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshRequestToJson(this);
}

enum StatisticType {
  TOTALGAMES,
  GAMESCOMPLETED,
  MOVIESWATCHED,
  COMICVOLUMES,
  COMICISSUES,
  FRIENDS,
  BOOKS,
  READBOOKS
}

enum FriendRetrieval { suggestions, requests, friends }
