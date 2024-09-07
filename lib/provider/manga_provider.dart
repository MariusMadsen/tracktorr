import 'package:flutter/material.dart';
import 'package:laruina/contracts/manga_contracts.dart';
import 'package:laruina/services/manga_service.dart';

class MangaModel extends ChangeNotifier {
  List<Manga> manga = [];

  void search(String text, BuildContext context) async {
    manga = await MangaService.searchManga(text);
    notifyListeners();
  }

  void clear() {
    manga = [];
    notifyListeners();
  }
}
