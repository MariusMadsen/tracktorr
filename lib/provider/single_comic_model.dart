import 'package:flutter/material.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/pages/comic/detailed_comic_page.dart';
import 'package:laruina/provider/comics_provider.dart';
import 'package:laruina/services/comics_service.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:provider/provider.dart';

class SingleComicModel extends ChangeNotifier {
  List<DetailedVolume> comicVolume = [];

  void get(ComicVolume volume, BuildContext context) async {
    Loader.load(context);

    await ComicsService.getComicVolume(volume).then((value) {
      comicVolume.add(value);
      return value;
    }).whenComplete(() {
      Loader.loadComplete(context);
      notifyListeners();
      push(context);
    });
  }

  Future<bool> refresh(BuildContext context) async {
    await ComicsService.getComicVolume(comicVolume.last.toComicVolume()).then((value) {
      comicVolume.removeLast();
      comicVolume.add(value);
      return value;
    }).whenComplete(() => context.read<ComicsModel>().refresh());
    notifyListeners();
    return true;
  }

  void push(BuildContext context) async {
    debugPrint("creating pop callback");
    await Navigator.push(
      context,
      RouteAnimationService.createRoute(
        page: const DetailedComicPage(),
      ),
    ).whenComplete(() async {
      comicVolume.removeLast();
      if (comicVolume.isNotEmpty) {
        debugPrint("callback Done");
        debugPrint("Popping last detailed movie ${comicVolume.length}");
        await refresh(context);
        notifyListeners();
      }
    });
  }
}
