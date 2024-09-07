import 'package:flutter/material.dart';
import 'package:laruina/provider/manga_provider.dart';
import 'package:laruina/widgets/manga/manga_tile_info.dart';
import 'package:laruina/widgets/tile/item_tile.dart';
import 'package:provider/provider.dart';

class Manga extends StatelessWidget {
  const Manga({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<MangaModel>(
          builder: (context, value, child) {
            if (value.manga.isEmpty) {
              return Container();
            }

            return ListView(
              children: value.manga
                  .map((e) => ItemTile(
                      buttons: const [],
                      img: e.filename,
                      tileInfo: MangaTileInfo(
                        manga: e,
                      )))
                  .toList(),
            );
          },
        ));
  }
}
