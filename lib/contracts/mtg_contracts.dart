import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part "mtg_contracts.g.dart";

@JsonSerializable()
class MtgResponse {
  final List<MtgCard> cards;
  final double? totalValue;
  final int? totalCards;
  final List<MtgSetStatistic>? setStatistics;
  MtgResponse(
      {required this.cards,
      this.totalValue,
      this.totalCards,
      this.setStatistics});

  factory MtgResponse.fromJson(Map<String, dynamic> json) =>
      _$MtgResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MtgResponseToJson(this);

  MtgResponse copyWith({
    List<MtgCard>? cards,
    double? totalValue,
    int? totalCards,
    List<MtgSetStatistic>? setStatistics,
  }) {
    return MtgResponse(
      cards: cards ?? this.cards,
      totalValue: totalValue ?? this.totalValue,
      totalCards: totalCards ?? this.totalCards,
      setStatistics: setStatistics ?? this.setStatistics,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MtgResponse &&
        listEquals(other.cards, cards) &&
        other.totalValue == totalValue &&
        other.totalCards == totalCards &&
        listEquals(other.setStatistics, setStatistics);
  }

  @override
  int get hashCode {
    return cards.hashCode ^
        totalValue.hashCode ^
        totalCards.hashCode ^
        setStatistics.hashCode;
  }
}

@JsonSerializable()
class MtgSetStatistic {
  final String setId;
  final double totalValue;
  final int cards;
  final double pricePerCard;
  MtgSetStatistic({
    required this.setId,
    required this.totalValue,
    required this.cards,
    required this.pricePerCard,
  });

  factory MtgSetStatistic.fromJson(Map<String, dynamic> json) =>
      _$MtgSetStatisticFromJson(json);
  Map<String, dynamic> toJson() => _$MtgSetStatisticToJson(this);
}

@JsonSerializable()
class MtgCard {
  final String id;
  final String title;
  final String text;
  final String? type;
  final String manaCost;
  final double convertedManaCost;
  final String? power;
  final String? toughness;
  final List<String> colors;
  final List<String> identity;
  final String setId;
  final String collectorNumber;
  final String img;
  final String? backImg;
  final String oracleId;
  final String? price;
  final bool foil;
  final bool etched;
  final bool showcase;
  final bool texture;
  final bool extended;
  final bool borderless;
  final bool gilded;
  final int quantity;

  MtgCard({
    required this.id,
    required this.title,
    required this.text,
    required this.type,
    required this.manaCost,
    required this.convertedManaCost,
    required this.power,
    required this.toughness,
    required this.colors,
    required this.identity,
    required this.setId,
    required this.collectorNumber,
    required this.img,
    required this.backImg,
    required this.oracleId,
    required this.price,
    required this.foil,
    required this.etched,
    required this.showcase,
    required this.texture,
    required this.extended,
    required this.borderless,
    required this.gilded,
    required this.quantity,
  });

  factory MtgCard.fromJson(Map<String, dynamic> json) =>
      _$MtgCardFromJson(json);
  Map<String, dynamic> toJson() => _$MtgCardToJson(this);

  List<String> manaCostColors() {
    List<String> res = [];
    if (manaCost.contains("B")) res.add("B");
    if (manaCost.contains("G")) res.add("G");
    if (manaCost.contains("R")) res.add("R");
    if (manaCost.contains("U")) res.add("U");
    if (manaCost.contains("W")) res.add("W");
    return res;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MtgCard &&
        other.id == id &&
        other.title == title &&
        other.text == text &&
        other.type == type &&
        other.manaCost == manaCost &&
        other.convertedManaCost == convertedManaCost &&
        other.power == power &&
        other.toughness == toughness &&
        listEquals(other.colors, colors) &&
        listEquals(other.identity, identity) &&
        other.setId == setId &&
        other.collectorNumber == collectorNumber &&
        other.img == img &&
        other.backImg == img &&
        other.oracleId == oracleId &&
        other.price == price &&
        other.foil == foil &&
        other.etched == etched &&
        other.showcase == showcase &&
        other.texture == texture &&
        other.extended == extended &&
        other.borderless == borderless &&
        other.gilded == gilded &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        text.hashCode ^
        type.hashCode ^
        manaCost.hashCode ^
        convertedManaCost.hashCode ^
        power.hashCode ^
        toughness.hashCode ^
        colors.hashCode ^
        identity.hashCode ^
        setId.hashCode ^
        collectorNumber.hashCode ^
        img.hashCode ^
        backImg.hashCode ^
        oracleId.hashCode ^
        price.hashCode ^
        foil.hashCode ^
        etched.hashCode ^
        showcase.hashCode ^
        texture.hashCode ^
        extended.hashCode ^
        borderless.hashCode ^
        gilded.hashCode ^
        quantity.hashCode;
  }

  @override
  String toString() {
    return 'MtgCard(id: $id, title: $title, text: $text, type: $type, manaCost: $manaCost, convertedManaCost: $convertedManaCost, power: $power, toughness: $toughness, colors: $colors, collectorNumber: $collectorNumber, img: $img, oracleId: $oracleId, price: $price, foil: $foil, etched: $etched, showcase: $showcase, texture: $texture, extended: $extended, quantity: $quantity)';
  }
}

@JsonSerializable()
class MtgSets {
  final List<MtgSet> sets;
  MtgSets({
    required this.sets,
  });

  factory MtgSets.fromJson(Map<String, dynamic> json) =>
      _$MtgSetsFromJson(json);
  Map<String, dynamic> toJson() => _$MtgSetsToJson(this);

  MtgSets copyWith({
    List<MtgSet>? sets,
  }) {
    return MtgSets(
      sets: sets ?? this.sets,
    );
  }
}

@JsonSerializable()
class MtgSet {
  final String setId;
  final String setName;
  final String setImg;

  MtgSet({
    required this.setId,
    required this.setName,
    required this.setImg,
  });

  factory MtgSet.fromJson(Map<String, dynamic> json) => _$MtgSetFromJson(json);
  Map<String, dynamic> toJson() => _$MtgSetToJson(this);
}
