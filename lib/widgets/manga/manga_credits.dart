import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/manga_contracts.dart';

class MangaCredits extends StatelessWidget {
  const MangaCredits({super.key, required this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (manga.author != null)
          Text.rich(
            TextSpan(
              text: "",
              children: [
                const WidgetSpan(
                  child: Icon(
                    FontAwesomeIcons.person,
                    size: 16,
                  ),
                ),
                TextSpan(
                    text: " ${manga.author}", style: const TextStyle(fontSize: 14))
              ],
            ),
          ),
        if (manga.artist != null)
          Text.rich(
            TextSpan(
              text: "",
              children: [
                const WidgetSpan(
                  child: Icon(
                    FontAwesomeIcons.feather,
                    size: 16,
                  ),
                ),
                TextSpan(
                    text: " ${manga.artist}", style: const TextStyle(fontSize: 14))
              ],
            ),
          )
      ],
    );
  }
}
