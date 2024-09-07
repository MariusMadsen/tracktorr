import 'package:flutter/material.dart';
import 'package:laruina/contracts/manga_contracts.dart';
import 'package:laruina/services/http_service.dart';

class MangaService {
  MangaService._();

  static final String _baseUrl = HttpService.getBaseUrl("manga");

  static Future<List<Manga>> searchManga(String search) async {
    return await HttpService.post(
      url: _baseUrl,
      body: SearchMangaRequest(title: search),
      resp: (List<dynamic> body) {
        debugPrint(body.toString());
        return body.map((e) => Manga.fromJson(e)).toList();
      },
    );
  }
}
