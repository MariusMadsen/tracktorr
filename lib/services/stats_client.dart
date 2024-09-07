import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/http_service.dart';

class StatsClient {
  StatsClient._();

  static final String _baseUrl = HttpService.getBaseUrl("user");

  static Future<UserStats> getStats() async {
    return HttpService.get(
      url: "$_baseUrl/stats",
      error: "Could not get userstats",
      resp: (Map<String, dynamic> body) {
        return UserStats.fromJson(body);
      },
    );
  }
}
