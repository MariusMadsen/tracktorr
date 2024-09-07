// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      userId: json['userId'] as String,
      message: json['message'] as String,
      img: json['img'] as String?,
      itemId: json['itemId'] as String?,
      instant: json['instant'] as String,
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'instant': instance.instant,
      'itemId': instance.itemId,
      'img': instance.img,
      'eventType': instance.eventType,
    };

EventPair _$EventPairFromJson(Map<String, dynamic> json) => EventPair(
      friend: Friend.fromJson(json['friend'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventPairToJson(EventPair instance) => <String, dynamic>{
      'friend': instance.friend,
      'events': instance.events,
    };
