import 'package:laruina/contracts/event_contracts.dart';
import 'package:laruina/services/http_service.dart';

class EventClient {
  EventClient._();

  static final String _baseUrl = HttpService.getBaseUrl("notification");

  static Future<List<EventPair>> getEvents() async {
    return HttpService.get(
      url: _baseUrl,
      error: "Could not get events",
      resp: (List<dynamic> body) {
        return body.map((e) => EventPair.fromJson(e)).toList();
      },
    );
  }
}
