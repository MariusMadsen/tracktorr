import 'package:json_annotation/json_annotation.dart';
import 'package:laruina/contracts/user_contracts.dart';

part "event_contracts.g.dart";

@JsonSerializable()
class Event {
  final String userId;
  final String message;
  final String instant;
  final String? itemId;
  final String? img;
  final String eventType;
  Event(
      {required this.userId,
      required this.message,
      this.img,
      this.itemId,
      required this.instant,
      required this.eventType});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class EventPair {
  final Friend friend;
  final List<Event> events;
  EventPair({
    required this.friend,
    required this.events,
  });

  factory EventPair.fromJson(Map<String, dynamic> json) =>
      _$EventPairFromJson(json);
  Map<String, dynamic> toJson() => _$EventPairToJson(this);
}
