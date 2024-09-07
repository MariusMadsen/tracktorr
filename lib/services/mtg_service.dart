import 'package:flutter/material.dart';
import 'package:laruina/contracts/mtg_contracts.dart';
import 'package:laruina/services/http_service.dart';

class MtgService {
  MtgService._();

  static final String _baseUrl = HttpService.getBaseUrl("mtg");

  static Future<MtgResponse> search(String title) async {
    return await HttpService.get(
        url: "$_baseUrl/search/$title",
        resp: (Map<String, dynamic> body) {
          debugPrint(body.toString());
          return MtgResponse.fromJson(body);
        });
  }

  static Future<MtgResponse> getOwnCards() async {
    return await HttpService.get(
        url: _baseUrl,
        resp: (Map<String, dynamic> body) {
          return MtgResponse.fromJson(body);
        });
  }

  static Future<MtgSets> getSets() async {
    return await HttpService.get(
        url: "$_baseUrl/sets",
        resp: (Map<String, dynamic> body) {
          return MtgSets.fromJson(body);
        });
  }

  static Future<MtgResponse> getSet(String set) async {
    return await HttpService.get(
        url: "$_baseUrl/sets/$set",
        resp: (Map<String, dynamic> body) {
          return MtgResponse.fromJson(body);
        });
  }

  static Future<MtgResponse> printings(MtgCard card) async {
    return await HttpService.post(
        url: "$_baseUrl/prints/",
        body: card.toJson(),
        resp: (Map<String, dynamic> body) {
          return MtgResponse.fromJson(body);
        });
  }

  static Future<void> add(MtgCard card) async {
    return await HttpService.post(url: "$_baseUrl/", body: card.toJson());
  }

  static remove(card) async {
    return await HttpService.post(
        url: "$_baseUrl/remove", body: card.toJson());
  }

  static Future<void> migrate() async {
    return await HttpService.get(url: "$_baseUrl/migrate");
  }

  static String getCardDetails(MtgCard card) {
    String text = "";
    if (card.showcase) {
      text += "Showcase ";
    }
    if (card.texture) {
      text += "Textured ";
    }
    if (card.etched) {
      text += "Etched ";
    }
    if (card.extended) {
      text += "Extended ";
    }
    if (card.borderless) {
      text += "Borderless ";
    }

    return text;
  }

  static int sortCards(MtgCard a, MtgCard b) {
    int cmpSet = a.setId.compareTo(b.setId);
    if (cmpSet != 0) {
      return cmpSet;
    }

    // Separate lands from other noncolors
    String aMainType = (a.type ?? "").split('//').first.trim();
    String bMainType = (b.type ?? "").split('//').first.trim();

    if (aMainType.contains("Land") && !bMainType.contains("Land")) {
      return -1;
    }
    if (!aMainType.contains("Land") && bMainType.contains("Land")) {
      return 1;
    }

    //colorless mana cost first
    var isAManaless = !MtgService.containsColoredManaCost(a);
    var isBManaless = !MtgService.containsColoredManaCost(b);

    if (isAManaless && !isBManaless) {
      return -1;
    }

    if (!isAManaless && isBManaless) {
      return 1;
    }

    // Sort on color
    int cmp =
        b.manaCostColors().toString().compareTo(a.manaCostColors().toString());
    if (cmp != 0) return cmp;

    // Sort on name
    int nameCmp = a.title.compareTo(b.title);
    if (nameCmp != 0) return nameCmp;

    // Sort on collectorNumber
    // Since collectorNumber is a string, try to sort first on collectorNumber
    // length, then the actual string
    int collectorLengthCmp =
        a.collectorNumber.length.compareTo(b.collectorNumber.length);
    if (collectorLengthCmp != 0) return collectorLengthCmp;
    int collectorCmp = a.collectorNumber.compareTo(b.collectorNumber);
    if (collectorCmp != 0) return collectorCmp;

    // Sort on foil/nonfoil
    if (a.foil) return 1;
    return -1;
  }

  static bool containsColoredManaCost(MtgCard a) {
    return a.manaCostColors().isNotEmpty;
  }
}
