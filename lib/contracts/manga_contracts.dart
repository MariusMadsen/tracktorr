import 'package:json_annotation/json_annotation.dart';

part "manga_contracts.g.dart";

@JsonSerializable()
class MangaChapter {
  final String id;
  final String mangaId;
  final String title;
  final int chapter;
  MangaChapter(
      {required this.id,
      required this.title,
      required this.mangaId,
      required this.chapter});
  factory MangaChapter.fromJson(Map<String, dynamic> json) =>
      _$MangaChapterFromJson(json);
  Map<String, dynamic> toJson() => _$MangaChapterToJson(this);
}

@JsonSerializable()
class ReadChapter {
  final String id;
  final String userId;
  final String mangaId;
  final String chapterId;
  ReadChapter(
      {required this.id,
      required this.chapterId,
      required this.mangaId,
      required this.userId});

  factory ReadChapter.fromJson(Map<String, dynamic> json) =>
      _$ReadChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ReadChapterToJson(this);
}

@JsonSerializable()
class Manga {
  final String id;
  final String title;
  final String filename;
  final int numChapters;
  final bool following;
  final List<ReadChapter> readChapters;
  final MangaChapter? nextToRead;
  final String? author;
  final String? artist;
  Manga({
    required this.id,
    required this.title,
    required this.filename,
    this.numChapters = 0,
    required this.following,
    this.readChapters = const [],
    this.nextToRead,
    this.artist,
    this.author
  });

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);
  Map<String, dynamic> toJson() => _$MangaToJson(this);
}

@JsonSerializable()
class SearchMangaRequest {
  final String title;
  SearchMangaRequest({
    required this.title,
  });

  factory SearchMangaRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchMangaRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchMangaRequestToJson(this);
}

@JsonSerializable()
class FollowMangaRequest {
  final String mangaId;
  final bool following;
  FollowMangaRequest({
    required this.mangaId,
    required this.following,
  });

  factory FollowMangaRequest.fromJson(Map<String, dynamic> json) =>
      _$FollowMangaRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FollowMangaRequestToJson(this);
}

enum MangaContext { followed, search, readOnly }

final Map<int, MangaContext> contexts = {
  0: MangaContext.followed,
  1: MangaContext.search
};
