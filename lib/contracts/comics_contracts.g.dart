// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicVolumeResponse _$ComicVolumeResponseFromJson(Map<String, dynamic> json) =>
    ComicVolumeResponse(
      volumes: (json['volumes'] as List<dynamic>)
          .map((e) => ComicVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishers: (json['publishers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ComicVolumeResponseToJson(
        ComicVolumeResponse instance) =>
    <String, dynamic>{
      'volumes': instance.volumes,
      'publishers': instance.publishers,
    };

DetailedIssue _$DetailedIssueFromJson(Map<String, dynamic> json) =>
    DetailedIssue(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      issue: json['issue'] as String,
      date: json['date'] as String,
      img: json['img'] as String,
      read: json['read'] as bool,
      volumeName: json['volumeName'] as String,
      volumeId: json['volumeId'] as String,
    );

Map<String, dynamic> _$DetailedIssueToJson(DetailedIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volumeId': instance.volumeId,
      'volumeName': instance.volumeName,
      'name': instance.name,
      'issue': instance.issue,
      'date': instance.date,
      'img': instance.img,
      'read': instance.read,
    };

DetailedVolume _$DetailedVolumeFromJson(Map<String, dynamic> json) =>
    DetailedVolume(
      id: json['id'] as String,
      name: json['name'] as String,
      year: json['year'] as String,
      publisher: json['publisher'] as String,
      img: json['img'] as String,
      numIssues: json['numIssues'] as int,
      followed: json['followed'] as bool,
      issues: (json['issues'] as List<dynamic>)
          .map((e) => DetailedIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailedVolumeToJson(DetailedVolume instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'publisher': instance.publisher,
      'img': instance.img,
      'numIssues': instance.numIssues,
      'followed': instance.followed,
      'issues': instance.issues,
    };

ComicVolume _$ComicVolumeFromJson(Map<String, dynamic> json) => ComicVolume(
      id: json['id'] as String,
      title: json['title'] as String,
      totalIssues: json['totalIssues'] as int,
      publisher: json['publisher'] as String,
      startingYear: json['startingYear'] as String,
      imageUrl: json['imageUrl'] as String,
      following: json['following'] as bool,
      percentRead: (json['percentRead'] as num).toDouble(),
      nextIssueToRead: json['nextIssueToRead'] == null
          ? null
          : ComicIssue.fromJson(
              json['nextIssueToRead'] as Map<String, dynamic>),
      order: json['order'] as String?,
    );

Map<String, dynamic> _$ComicVolumeToJson(ComicVolume instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'totalIssues': instance.totalIssues,
      'publisher': instance.publisher,
      'startingYear': instance.startingYear,
      'imageUrl': instance.imageUrl,
      'following': instance.following,
      'percentRead': instance.percentRead,
      'nextIssueToRead': instance.nextIssueToRead,
      'order': instance.order,
    };

ComicIssue _$ComicIssueFromJson(Map<String, dynamic> json) => ComicIssue(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      issue: json['issue'] as String,
      imageUrl: json['imageUrl'] as String,
      releaseDate: json['releaseDate'] as String? ?? "????",
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$ComicIssueToJson(ComicIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issue': instance.issue,
      'imageUrl': instance.imageUrl,
      'releaseDate': instance.releaseDate,
      'read': instance.read,
    };

ComicVolumeFollowRequest _$ComicVolumeFollowRequestFromJson(
        Map<String, dynamic> json) =>
    ComicVolumeFollowRequest(
      comicVolume:
          ComicVolume.fromJson(json['comicVolume'] as Map<String, dynamic>),
      follow: json['follow'] as bool,
    );

Map<String, dynamic> _$ComicVolumeFollowRequestToJson(
        ComicVolumeFollowRequest instance) =>
    <String, dynamic>{
      'comicVolume': instance.comicVolume,
      'follow': instance.follow,
    };

ComicIssueReadRequest _$ComicIssueReadRequestFromJson(
        Map<String, dynamic> json) =>
    ComicIssueReadRequest(
      read: json['read'] as bool,
    );

Map<String, dynamic> _$ComicIssueReadRequestToJson(
        ComicIssueReadRequest instance) =>
    <String, dynamic>{
      'read': instance.read,
    };
