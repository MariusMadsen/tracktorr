import 'package:flutter/material.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/friend_service.dart';

class FriendsModel with ChangeNotifier {
  bool _initialLoaded = false;
  UserFriends userFriends = UserFriends(friends: {}, friendRequests: {});

  void initialFetch() {
    if (!_initialLoaded) {
      _initialLoaded = true;
      fetch();
    }
  }

  Future<void> fetch() async {
    userFriends = await FriendService().getUserFriends();
    notifyListeners();
    return await Future.value();
  }
}
