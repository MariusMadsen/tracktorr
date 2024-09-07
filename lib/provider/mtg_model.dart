import 'package:flutter/material.dart';
import 'package:laruina/contracts/mtg_contracts.dart';
import 'package:laruina/pages/mtg/mtg.dart';
import 'package:laruina/pages/mtg/mtg_own.dart';
import 'package:laruina/pages/mtg/mtg_printings.dart';
import 'package:laruina/pages/mtg/mtg_set.dart';
import 'package:laruina/pages/mtg/mtg_sets.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/mtg_service.dart';
import 'package:laruina/services/route_animation_service.dart';

class MtgModel extends ChangeNotifier {
  MtgResponse? response;
  MtgResponse? printsResponse;
  MtgResponse? setResponse;
  MtgResponse? ownCards;
  MtgResponse? filteredResponse;

  MtgSets mtgSets = MtgSets(sets: []);
  MtgSets filteredSets = MtgSets(sets: []);
  Function reGet = () {};
  String _text = "";
  String _setText = "";
  bool loading = false;

  void clear() {
    _text = "";
    reGet = () {};
    response = null;

    notifyListeners();
  }

  void filterSet(String text) {
    _setText = text.toLowerCase();
    debugPrint(_setText);
    filteredSets = mtgSets.copyWith(
        sets: mtgSets.sets
            .where((element) =>
                element.setId.toLowerCase().contains(_setText) ||
                element.setName.toLowerCase().contains(_setText))
            .toList());
    notifyListeners();
  }

  void filter(String text, String viewContext) {
    _text = text; // Set text incase of refetch
    MtgResponse res;
    if (viewContext == "own" && ownCards != null) {
      res = ownCards!;
      debugPrint("Filtering on own");
    } else if (viewContext == "set" && setResponse != null) {
      res = setResponse!;
      debugPrint("Filtering on set");
    } else {
      debugPrint("Filtering on nothing");
      return;
    }

    filteredResponse = res.copyWith(
        cards: res.cards
            .where((element) =>
                element.title.toLowerCase().startsWith(_text.toLowerCase()))
            .toList());
    notifyListeners();
    debugPrint("Inner searched yielded ${filteredResponse!.cards.length}");
  }

  void search(String title, BuildContext context, {newPage = true}) async {
    Loader.load(context);
    reGet = (applyLoad) => search(title, context, newPage: false);

    response = await MtgService.search(title).whenComplete(() {
      // ignore: use_build_context_synchronously
      renderComplete(context, "search", newPage);
    });
  }

  void searchPrintings(MtgCard card, BuildContext context,
      {newPage = true}) async {
    Loader.load(context);
    reGet = () => searchPrintings(card, context, newPage: false);

    printsResponse = await MtgService.printings(card).whenComplete(() {
      // ignore: use_build_context_synchronously
      renderComplete(context, "printings", newPage);
    });
  }

  void getOwnCards(BuildContext context, {newPage = true}) async {
    Loader.load(context);
    reGet = () => getOwnCards(context, newPage: false);

    ownCards = await MtgService.getOwnCards().whenComplete(() {
      renderComplete(context, "own", newPage);
    });
    filter(_text, "own");
  }

  void getSets(BuildContext context, {newPage = true}) async {
    Loader.load(context);
    reGet = () => getSets(context, newPage: false);

    mtgSets = await MtgService.getSets().whenComplete(() {
      renderComplete(context, "sets", newPage);
    });
    filterSet(_setText);
  }

  void selectSet(BuildContext context, String set, {newPage = true}) async {
    Loader.load(context);
    reGet = () => selectSet(context, set, newPage: false);

    setResponse = await MtgService.getSet(set).whenComplete(() {
      renderComplete(context, "set", newPage);
    });
    filter(_text, "set");
  }

  void add(BuildContext context, MtgCard card, String viewContext) async {
    Loader.load(context);
    await MtgService.add(card)
        .then((value) async => await refresh(context, viewContext))
        .whenComplete(() => Loader.loadComplete(context));
  }

  Future<void> remove(
      BuildContext context, MtgCard card, String viewContext) async {
    Loader.load(context);
    await MtgService.remove(card)
        .then((value) async => await refresh(context, viewContext))
        .whenComplete(() => Loader.loadComplete(context));
  }

  void navigateToMtg(String navigator, BuildContext context) {
    Widget navigation;
    if (navigator == "own") {
      navigation = const MtgOwn();
    } else if (navigator == "printings") {
      navigation = const MtgPrintings();
    } else if (navigator == "search") {
      navigation = const Mtg();
    } else if (navigator == "sets") {
      navigation = const MtgSetsPage();
    } else if (navigator == "set") {
      navigation = const MtgSetPage();
    } else {
      throw Exception("I CANT READ THIS VIEWCONTEXT");
    }

    Navigator.of(context)
        // ignore: prefer_const_constructors

        .push(RouteAnimationService.createRoute(
            page: navigation,
            offset: const Offset(0.0, 1.0),
            duration: const Duration(milliseconds: 1250)));
  }

  void renderComplete(BuildContext context, String navigator, bool newPage) {
    notifyListeners();
    Loader.loadComplete(context);
    if (newPage) {
      _text = "";
      filter(_text, navigator);
      navigateToMtg(navigator, context);
    }
  }

  Future<bool> refresh(BuildContext context, String viewContext) async {
    await reGet();
    notifyListeners();
    return true;
  }
}
