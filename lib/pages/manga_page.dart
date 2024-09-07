import 'package:flutter/material.dart';
import 'package:laruina/provider/manga_provider.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/appbar/search_app_bar.dart';
import 'package:laruina/widgets/common/search_content.dart';
import 'package:laruina/widgets/manga/manga.dart';
import 'package:provider/provider.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({super.key});

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  final TextEditingController searchMangaController = TextEditingController();

  bool searched = false;

  void search(MangaModel model) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.search(searchMangaController.text, context);
    setState(
      () {
        searched = true;
      },
    );
  }

  void clear(MangaModel model) {
    searchMangaController.clear();
    model.clear();
    setState(() {
      searched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesModel = context.read<MangaModel>();

    return Scaffold(
      appBar: SearchAppBar(
          searched: searched,
          controller: searchMangaController,
          hintText: 'Search manga',),
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Center(
          child: searched
              ? const Manga()
              : SearchContent(
                  searchController: searchMangaController,
                  search: () => search(
                    moviesModel,
                  ),
                  hintText: "Search for any manga..",
                ),
        ),
      ),
    );
  }
}
