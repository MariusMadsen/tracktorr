import 'package:flutter/material.dart';
import 'package:laruina/contracts/event_contracts.dart';
import 'package:laruina/services/event_client.dart';

class EventModel extends ChangeNotifier {
  List<EventPair> events = [];

  void get() async {
    events = await EventClient.getEvents();
    notifyListeners();
  }
}
