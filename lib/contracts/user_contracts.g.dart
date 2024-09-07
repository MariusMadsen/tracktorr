// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      id: json['id'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String? ?? "",
      lastName: json['lastName'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      steamId: json['steamId'] as String? ?? "",
      xboxUser: json['xboxUser'] == null
          ? const XboxUser(
              xboxId: "", gamertag: "", realName: "", profilePicture: "")
          : XboxUser.fromJson(json['xboxUser'] as Map<String, dynamic>),
      playstationUser: json['playstationUser'] == null
          ? const PlaystationUser(playstationId: "", username: "", img: "")
          : PlaystationUser.fromJson(
              json['playstationUser'] as Map<String, dynamic>),
      spotifyCode: json['spotifyCode'] as String? ?? "",
      admin: json['admin'] as bool? ?? false,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'gender': _$GenderEnumMap[instance.gender]!,
      'steamId': instance.steamId,
      'xboxUser': instance.xboxUser,
      'playstationUser': instance.playstationUser,
      'spotifyCode': instance.spotifyCode,
      'admin': instance.admin,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.TBA: 'TBA',
};

XboxUser _$XboxUserFromJson(Map<String, dynamic> json) => XboxUser(
      xboxId: json['xboxId'] as String? ?? "",
      gamertag: json['gamertag'] as String? ?? "",
      realName: json['realName'] as String? ?? "",
      profilePicture: json['profilePicture'] as String? ?? "",
    );

Map<String, dynamic> _$XboxUserToJson(XboxUser instance) => <String, dynamic>{
      'xboxId': instance.xboxId,
      'gamertag': instance.gamertag,
      'realName': instance.realName,
      'profilePicture': instance.profilePicture,
    };

PlaystationUser _$PlaystationUserFromJson(Map<String, dynamic> json) =>
    PlaystationUser(
      playstationId: json['playstationId'] as String,
      username: json['username'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$PlaystationUserToJson(PlaystationUser instance) =>
    <String, dynamic>{
      'playstationId': instance.playstationId,
      'username': instance.username,
      'img': instance.img,
    };

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      id: json['id'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };

UserFriends _$UserFriendsFromJson(Map<String, dynamic> json) => UserFriends(
      friends: (json['friends'] as List<dynamic>)
          .map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toSet(),
      friendRequests: (json['friendRequests'] as List<dynamic>)
          .map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$UserFriendsToJson(UserFriends instance) =>
    <String, dynamic>{
      'friends': instance.friends.toList(),
      'friendRequests': instance.friendRequests.toList(),
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      jwt: json['jwt'] as String,
      refreshToken: json['refreshToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      ttl: json['ttl'] as int,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'ttl': instance.ttl,
    };

AddFriendRequest _$AddFriendRequestFromJson(Map<String, dynamic> json) =>
    AddFriendRequest(
      friendId: json['friendId'] as String,
    );

Map<String, dynamic> _$AddFriendRequestToJson(AddFriendRequest instance) =>
    <String, dynamic>{
      'friendId': instance.friendId,
    };

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => Statistic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatsToJson(UserStats instance) => <String, dynamic>{
      'statistics': instance.statistics,
    };

Statistic _$StatisticFromJson(Map<String, dynamic> json) => Statistic(
      statType: $enumDecode(_$StatisticTypeEnumMap, json['statType']),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'statType': _$StatisticTypeEnumMap[instance.statType]!,
      'amount': instance.amount,
    };

const _$StatisticTypeEnumMap = {
  StatisticType.TOTALGAMES: 'TOTALGAMES',
  StatisticType.GAMESCOMPLETED: 'GAMESCOMPLETED',
  StatisticType.MOVIESWATCHED: 'MOVIESWATCHED',
  StatisticType.COMICVOLUMES: 'COMICVOLUMES',
  StatisticType.COMICISSUES: 'COMICISSUES',
  StatisticType.FRIENDS: 'FRIENDS',
  StatisticType.BOOKS: 'BOOKS',
  StatisticType.READBOOKS: 'READBOOKS',
};

RegisterNewUser _$RegisterNewUserFromJson(Map<String, dynamic> json) =>
    RegisterNewUser(
      email: json['email'] as String,
    );

Map<String, dynamic> _$RegisterNewUserToJson(RegisterNewUser instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

LaruinaResponse<T> _$LaruinaResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    LaruinaResponse<T>(
      success: json['success'] as bool,
      clientHasLatest: json['clientHasLatest'] as bool,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$LaruinaResponseToJson<T>(
  LaruinaResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'clientHasLatest': instance.clientHasLatest,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) =>
    RefreshRequest(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshRequestToJson(RefreshRequest instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };
