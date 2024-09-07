// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaChapter _$MangaChapterFromJson(Map<String, dynamic> json) => MangaChapter(
      id: json['id'] as String,
      title: json['title'] as String,
      mangaId: json['mangaId'] as String,
      chapter: json['chapter'] as int,
    );

Map<String, dynamic> _$MangaChapterToJson(MangaChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mangaId': instance.mangaId,
      'title': instance.title,
      'chapter': instance.chapter,
    };

ReadChapter _$ReadChapterFromJson(Map<String, dynamic> json) => ReadChapter(
      id: json['id'] as String,
      chapterId: json['chapterId'] as String,
      mangaId: json['mangaId'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$ReadChapterToJson(ReadChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'mangaId': instance.mangaId,
      'chapterId': instance.chapterId,
    };

Manga _$MangaFromJson(Map<String, dynamic> json) => Manga(
      id: json['id'] as String,
      title: json['title'] as String,
      filename: json['filename'] as String,
      numChapters: json['numChapters'] as int? ?? 0,
      following: json['following'] as bool,
      readChapters: (json['readChapters'] as List<dynamic>?)
              ?.map((e) => ReadChapter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextToRead: json['nextToRead'] == null
          ? null
          : MangaChapter.fromJson(json['nextToRead'] as Map<String, dynamic>),
      artist: json['artist'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'filename': instance.filename,
      'numChapters': instance.numChapters,
      'following': instance.following,
      'readChapters': instance.readChapters,
      'nextToRead': instance.nextToRead,
      'author': instance.author,
      'artist': instance.artist,
    };

SearchMangaRequest _$SearchMangaRequestFromJson(Map<String, dynamic> json) =>
    SearchMangaRequest(
      title: json['title'] as String,
    );

Map<String, dynamic> _$SearchMangaRequestToJson(SearchMangaRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

FollowMangaRequest _$FollowMangaRequestFromJson(Map<String, dynamic> json) =>
    FollowMangaRequest(
      mangaId: json['mangaId'] as String,
      following: json['following'] as bool,
    );

Map<String, dynamic> _$FollowMangaRequestToJson(FollowMangaRequest instance) =>
    <String, dynamic>{
      'mangaId': instance.mangaId,
      'following': instance.following,
    };
