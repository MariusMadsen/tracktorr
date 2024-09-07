// ignore_for_file: constant_identifier_names


import 'package:json_annotation/json_annotation.dart';

part "comics_contracts.g.dart";

@JsonSerializable()
class ComicVolumeResponse {
  final List<ComicVolume> volumes;
  final List<String> publishers;
  ComicVolumeResponse({
    required this.volumes,
    required this.publishers,
  });
  factory ComicVolumeResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVolumeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ComicVolumeResponseToJson(this);
}

@JsonSerializable()
class DetailedIssue {
  final String id;
  final String volumeId;
  final String volumeName;
  final String name;
  final String issue;
  final String date;
  final String img;
  final bool read;
  DetailedIssue(
      {required this.id,
      this.name = "",
      required this.issue,
      required this.date,
      required this.img,
      required this.read,
      required this.volumeName,
      required this.volumeId});

  factory DetailedIssue.fromJson(Map<String, dynamic> json) =>
      _$DetailedIssueFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedIssueToJson(this);
}

@JsonSerializable()
class DetailedVolume {
  final String id;
  final String name;
  final String year;
  final String publisher;
  final String img;
  final int numIssues;
  final bool followed;
  final List<DetailedIssue> issues;
  DetailedVolume({
    required this.id,
    required this.name,
    required this.year,
    required this.publisher,
    required this.img,
    required this.numIssues,
    required this.followed,
    required this.issues,
  });

  ComicVolume toComicVolume() {
    return ComicVolume(
        id: id,
        title: name,
        totalIssues: numIssues,
        publisher: publisher,
        startingYear: year,
        imageUrl: img,
        following: followed,
        percentRead: 0,
        nextIssueToRead: null,
        order: null);
  }

  factory DetailedVolume.fromJson(Map<String, dynamic> json) =>
      _$DetailedVolumeFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedVolumeToJson(this);
}

@JsonSerializable()
class ComicVolume {
  final String id;
  final String title;
  final int totalIssues;
  final String publisher;
  final String startingYear;
  final String imageUrl;
  final bool following;
  final double percentRead;
  final ComicIssue? nextIssueToRead;
  final String? order;

  ComicVolume(
      {required this.id,
      required this.title,
      required this.totalIssues,
      required this.publisher,
      required this.startingYear,
      required this.imageUrl,
      required this.following,
      required this.percentRead,
      required this.nextIssueToRead,
      required this.order});
  factory ComicVolume.fromJson(Map<String, dynamic> json) =>
      _$ComicVolumeFromJson(json);
  Map<String, dynamic> toJson() => _$ComicVolumeToJson(this);

  @override
  String toString() {
    return 'ComicVolume(id: $id, title: $title, totalIssues: $totalIssues, publisher: $publisher, startingYear: $startingYear, imageUrl: $imageUrl, following: $following, percentRead: $percentRead, nextIssueToRead: $nextIssueToRead, order: $order)';
  }
}

@JsonSerializable()
class ComicIssue {
  final String id;
  final String name;
  final String issue;
  final String imageUrl;
  final String releaseDate;
  final bool read;
  ComicIssue({
    required this.id,
    this.name = "",
    required this.issue,
    required this.imageUrl,
    this.releaseDate = "????",
    this.read = false,
  });

  factory ComicIssue.fromJson(Map<String, dynamic> json) =>
      _$ComicIssueFromJson(json);
  Map<String, dynamic> toJson() => _$ComicIssueToJson(this);

  @override
  String toString() {
    return 'ComicIssue(id: $id, name: $name, issue: $issue, imageUrl: $imageUrl, releaseDate: $releaseDate, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComicIssue &&
        other.id == id &&
        other.name == name &&
        other.issue == issue &&
        other.imageUrl == imageUrl &&
        other.releaseDate == releaseDate &&
        other.read == read;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        issue.hashCode ^
        imageUrl.hashCode ^
        releaseDate.hashCode ^
        read.hashCode;
  }
}

@JsonSerializable()
class ComicVolumeFollowRequest {
  final ComicVolume comicVolume;
  final bool follow;
  ComicVolumeFollowRequest({
    required this.comicVolume,
    required this.follow,
  });

  factory ComicVolumeFollowRequest.fromJson(Map<String, dynamic> json) =>
      _$ComicVolumeFollowRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ComicVolumeFollowRequestToJson(this);
}

@JsonSerializable()
class ComicIssueReadRequest {
  final bool read;
  ComicIssueReadRequest({
    required this.read,
  });
  factory ComicIssueReadRequest.fromJson(Map<String, dynamic> json) =>
      _$ComicIssueReadRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ComicIssueReadRequestToJson(this);
}

enum ComicSort { NAME, ISSUES, ISSUE_DESC, PUBLISHER, RELEASEYEAR }

enum ComicsContext { followed, search, order, readOnly }

enum ComicsOrder { none, dc, marvel }

final Map<int, ComicsContext> contexts = {
  0: ComicsContext.followed,
  1: ComicsContext.search,
  2: ComicsContext.order
};

final Map<int, ComicsOrder> orders = {
  0: ComicsOrder.none,
  1: ComicsOrder.none,
  2: ComicsOrder.dc,
};
