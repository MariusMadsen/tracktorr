import 'package:flutter/material.dart';
import 'package:laruina/contracts/manga_contracts.dart';
import 'package:laruina/widgets/manga/manga_credits.dart';

class MangaTileInfo extends StatelessWidget {
  const MangaTileInfo({super.key, required this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(manga.title), MangaCredits(manga: manga)],
    );
  }
}
