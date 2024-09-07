// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtg_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MtgResponse _$MtgResponseFromJson(Map<String, dynamic> json) => MtgResponse(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => MtgCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalValue: (json['totalValue'] as num?)?.toDouble(),
      totalCards: json['totalCards'] as int?,
      setStatistics: (json['setStatistics'] as List<dynamic>?)
          ?.map((e) => MtgSetStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MtgResponseToJson(MtgResponse instance) =>
    <String, dynamic>{
      'cards': instance.cards,
      'totalValue': instance.totalValue,
      'totalCards': instance.totalCards,
      'setStatistics': instance.setStatistics,
    };

MtgSetStatistic _$MtgSetStatisticFromJson(Map<String, dynamic> json) =>
    MtgSetStatistic(
      setId: json['setId'] as String,
      totalValue: (json['totalValue'] as num).toDouble(),
      cards: json['cards'] as int,
      pricePerCard: (json['pricePerCard'] as num).toDouble(),
    );

Map<String, dynamic> _$MtgSetStatisticToJson(MtgSetStatistic instance) =>
    <String, dynamic>{
      'setId': instance.setId,
      'totalValue': instance.totalValue,
      'cards': instance.cards,
      'pricePerCard': instance.pricePerCard,
    };

MtgCard _$MtgCardFromJson(Map<String, dynamic> json) => MtgCard(
      id: json['id'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      type: json['type'] as String?,
      manaCost: json['manaCost'] as String,
      convertedManaCost: (json['convertedManaCost'] as num).toDouble(),
      power: json['power'] as String?,
      toughness: json['toughness'] as String?,
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      identity:
          (json['identity'] as List<dynamic>).map((e) => e as String).toList(),
      setId: json['setId'] as String,
      collectorNumber: json['collectorNumber'] as String,
      img: json['img'] as String,
      backImg: json['backImg'] as String?,
      oracleId: json['oracleId'] as String,
      price: json['price'] as String?,
      foil: json['foil'] as bool,
      etched: json['etched'] as bool,
      showcase: json['showcase'] as bool,
      texture: json['texture'] as bool,
      extended: json['extended'] as bool,
      borderless: json['borderless'] as bool,
      gilded: json['gilded'] as bool,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$MtgCardToJson(MtgCard instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'type': instance.type,
      'manaCost': instance.manaCost,
      'convertedManaCost': instance.convertedManaCost,
      'power': instance.power,
      'toughness': instance.toughness,
      'colors': instance.colors,
      'identity': instance.identity,
      'setId': instance.setId,
      'collectorNumber': instance.collectorNumber,
      'img': instance.img,
      'backImg': instance.backImg,
      'oracleId': instance.oracleId,
      'price': instance.price,
      'foil': instance.foil,
      'etched': instance.etched,
      'showcase': instance.showcase,
      'texture': instance.texture,
      'extended': instance.extended,
      'borderless': instance.borderless,
      'gilded': instance.gilded,
      'quantity': instance.quantity,
    };

MtgSets _$MtgSetsFromJson(Map<String, dynamic> json) => MtgSets(
      sets: (json['sets'] as List<dynamic>)
          .map((e) => MtgSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MtgSetsToJson(MtgSets instance) => <String, dynamic>{
      'sets': instance.sets,
    };

MtgSet _$MtgSetFromJson(Map<String, dynamic> json) => MtgSet(
      setId: json['setId'] as String,
      setName: json['setName'] as String,
      setImg: json['setImg'] as String,
    );

Map<String, dynamic> _$MtgSetToJson(MtgSet instance) => <String, dynamic>{
      'setId': instance.setId,
      'setName': instance.setName,
      'setImg': instance.setImg,
    };
