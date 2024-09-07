import 'package:flutter/material.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/stats_client.dart';

class StatisticModel extends ChangeNotifier {
  UserStats? stats;

  void get() async {
    debugPrint("Fetching stats");
    stats = await StatsClient.getStats();
    notifyListeners();
  }
}
