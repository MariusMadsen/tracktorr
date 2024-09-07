import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/http_service.dart';

class FriendService {
  final String _baseUrl = HttpService.getBaseUrl("user/friends");

  Future<UserFriends> getUserFriends() async {
    return HttpService.get(
      url: _baseUrl,
      error: "Could not get friends",
      resp: (Map<String, dynamic> body) {
        return UserFriends.fromJson(body);
      },
    );
  }

  Future<Set<Friend>> getFriendSuggestions() async {
    return HttpService.get(
      url: "$_baseUrl/suggestions",
      error: "Could not get friendsuggestions",
      resp: (List<dynamic> body) {
        return body.map((e) => Friend.fromJson(e)).toSet();
      },
    );
  }

  void addFriend({required Friend friend, required Function refresh}) async {
    return HttpService.post(
      url: "$_baseUrl/request",
      body: AddFriendRequest(friendId: friend.id),
      refresh: () => refresh(),
      error: "Could not add friend",
    );
  }

  void denyFriend({required Friend friend, required Function refresh}) async {
    return HttpService.post(
      url: "$_baseUrl/ignore",
      body: AddFriendRequest(friendId: friend.id),
      refresh: () => refresh(),
      error: "Could not add friend",
    );
  }
}
