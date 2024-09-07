import 'package:flutter/material.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/services/http_service.dart';

class ComicsService {
  ComicsService._();

  static final String _baseUrl = HttpService.getBaseUrl("comics");

  static Future<ComicVolumeResponse> getOrder() {
    return HttpService.get(
      url: "$_baseUrl/orders/dc",
      resp: (Map<String, dynamic> body) {
        return ComicVolumeResponse.fromJson(body);
      },
    );
  }

  static Future<ComicVolumeResponse> getOwnComics(
      {String? sort,
      String? publisher,
      bool? filterOnRead,
      required String search}) async {
    String query = "";
    query = _addQuery(query, "sort", sort);
    query = _addQuery(query, "publisher", publisher);
    query = _addQuery(query, "filterOnRead", filterOnRead);
    query = _addQuery(query, "search", search.isEmpty ? null : search);

    return HttpService.get(
      url: "$_baseUrl/volumes$query",
      resp: (Map<String, dynamic> body) {
        return ComicVolumeResponse.fromJson(body);
      },
    );
  }

  static Future<void> followVolume(ComicVolumeFollowRequest request) async {
    debugPrint(request.comicVolume.id);
    return HttpService.post(url: "$_baseUrl/volumes/follow", body: request);
  }

  static Future<ComicVolumeResponse> searchComics(
      {String? sort, String? publisher, required String search}) async {
    if (search.isEmpty) {
      return Future<ComicVolumeResponse>.value(
          ComicVolumeResponse(volumes: [], publishers: []));
    }
    String query = "";
    query = _addQuery(query, "sort", sort);
    query = _addQuery(query, "publisher", publisher);
    query = _addQuery(query, "query", search);

    return HttpService.get(
      url: "$_baseUrl/_search$query",
      resp: (Map<String, dynamic> body) {
        return ComicVolumeResponse.fromJson(body);
      },
    );
  }

  static Future<void> readIssue({
    required String volumeId,
    required String issueId,
    required ComicIssueReadRequest request,
  }) async {
    return await HttpService.post(
        url: "$_baseUrl/volumes/$volumeId/issues/$issueId/read", body: request);
  }

  static Future<void> readAllIssues({required String volumeId}) async {
    return await HttpService.post(
        url: "$_baseUrl/volumes/$volumeId/issues/read-all");
  }

  static Future<DetailedVolume> getComicVolume(ComicVolume comicVolume) async {
    String path = comicVolume.order == null
        ? "volumes/${comicVolume.id}"
        : "orders/${comicVolume.order}";

    String url = "$_baseUrl/$path";

    return HttpService.get(
      url: url,
      resp: (Map<String, dynamic> body) {
        return DetailedVolume.fromJson(body);
      },
    );
  }

  static String _addQuery(String query, String name, Object? value) {
    if (value == null) {
      return query;
    }
    query += query.isEmpty ? "?" : "&";
    query += "$name=$value";
    return query;
  }
}
