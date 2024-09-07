import 'package:flutter/material.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/pages/comic/comics.dart';
import 'package:laruina/services/comics_service.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/route_animation_service.dart';

class ComicsModel extends ChangeNotifier {
  List<ComicVolume> comicVolumes = [];
  List<ComicVolume> filteredResult = [];
  bool orderView = false;

  Function reGet = () {}; // Store the latest function used to refetch from BE
  String _text = ""; // searchtext used in filter

  void follow(ComicVolume volume, BuildContext context) async {
    Loader.load(context);
    await ComicsService.followVolume(ComicVolumeFollowRequest(
            comicVolume: volume, follow: !volume.following))
        .then((value) async => await refresh())
        .whenComplete(() => Loader.loadComplete(context));
  }

  void read(ComicVolume volume, BuildContext context) async {
    Loader.load(context);
    await ComicsService.readIssue(
            issueId: volume.nextIssueToRead!.id,
            volumeId: volume.id,
            request: ComicIssueReadRequest(read: true))
        .then((value) async => await refresh())
        .whenComplete(() => Loader.loadComplete(context));
  }

  void readAll(ComicVolume volume, BuildContext context) async {
    Loader.load(context);
    await ComicsService.readAllIssues(volumeId: volume.id)
        .then((value) async => await refresh())
        .whenComplete(() => Loader.loadComplete(context));
  }

  void search(String title, BuildContext context, {newPage = true}) async {
    orderView = false;
    reGet = () => search(title, context, newPage: false);

    Loader.load(context);
    comicVolumes = await ComicsService.searchComics(search: title)
        .then((value) => value.volumes)
        .whenComplete(() => renderComplete(context, newPage));
    filter(_text);
  }

  void getOrder(BuildContext context, {newPage = true}) async {
    orderView = true;
    reGet = () => getOrder(context, newPage: false);

    Loader.load(context);
    comicVolumes = await ComicsService.getOrder()
        .then((value) => value.volumes)
        .whenComplete(() => renderComplete(context, newPage));
    filter(_text);
  }

  void getOwnOngoingComics(BuildContext context, {newPage = true}) async {
    orderView = false;

    reGet = () => getOwnOngoingComics(context, newPage: false);

    Loader.load(context);
    comicVolumes = await ComicsService.getOwnComics(search: "")
        .then((value) => value.volumes)
        .then((value) => value
            .where((element) => element.percentRead != 100.0)
            .where((element) => element.percentRead != 0)
            .toList())
        .whenComplete(() => renderComplete(context, newPage));
    filter(_text);
  }

  void getOwnUnstartedComics(BuildContext context, {newPage = true}) async {
    orderView = false;

    reGet = () => getOwnUnstartedComics(context, newPage: false);

    Loader.load(context);
    comicVolumes = await ComicsService.getOwnComics(search: "")
        .then((value) => value.volumes)
        .then((value) =>
            value.where((element) => element.percentRead == 0).toList())
        .whenComplete(() => renderComplete(context, newPage));
    filter(_text);
  }

  void getOwnFinishedComics(BuildContext context, {newPage = true}) async {
    orderView = false;

    reGet = () => getOwnFinishedComics(context, newPage: false);

    Loader.load(context);
    comicVolumes = await ComicsService.getOwnComics(search: "")
        .then((value) => value.volumes)
        .then((value) =>
            value.where((element) => element.percentRead == 100.0).toList())
        .whenComplete(() => renderComplete(context, newPage));
    filter(_text);
  }

  void renderComplete(BuildContext context, bool newPage) {
    Loader.loadComplete(context);
    if (newPage) {
      _text = "";
      filter(_text);
      navigateToComics(context);
    }
    notifyListeners();
  }

  void navigateToComics(BuildContext context) async {
    Navigator.of(context).push(RouteAnimationService.createRoute(
        page: Comics(
          orderView: orderView,
        ),
        offset: const Offset(0.0, 1.0),
        duration: const Duration(milliseconds: 1250)));
  }

  Future<bool> refresh() async {
    reGet();
    filter(_text);
    notifyListeners();
    return true;
  }

  void filter(String text) {
    if (comicVolumes.isEmpty) {
      return;
    }
    _text = text; // Set text incase of refetch
    debugPrint("FILTERING $text");
    debugPrint("I HAVE THIS MANY ORIGNALLY ${comicVolumes.length}");

    filteredResult = comicVolumes
        .where((element) =>
            element.title.toLowerCase().contains(_text.toLowerCase()))
        .toList();
    debugPrint("I HAVE THIS MANY AFTER FILTERED ${filteredResult.length}");

    notifyListeners();
    debugPrint("Inner searched yielded ${filteredResult.length}");
  }
}
