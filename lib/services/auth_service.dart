import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:http/http.dart' as http;
import 'package:laruina/services/http_service.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AuthService {
  AuthService._();

  static Future<bool> login(
      String email, String password, BuildContext context) async {
    var body = UserLogin(email: email.trim(), password: password.trim());

    final response = await http
        .post(
      Uri.parse("https://laruina-java.herokuapp.com/authenticate"),
      headers: {"Content-Type": "application/json"},
      body: body.toJson(),
    )
        .whenComplete(() {
      Navigator.pop(context);
    });
    if (response.statusCode == 200) {
      final prefs = await StreamingSharedPreferences.instance;
      prefs.setString("user", response.body);
      return true;
    } else {
      throw NotAuthorizedException();
    }
  }

  static void logout() async {
    final prefs = await StreamingSharedPreferences.instance;
    prefs.remove("user");
  }

  static Future<bool> refreshToken() async {
    final refreshToken = await StreamingSharedPreferences.instance
        .then((value) => value.getString("user", defaultValue: ""))
        .then((value) => value.getValue())
        .then((value) => jsonDecode(value))
        .then((value) => AuthResponse.fromJson(value))
        .then((value) => value.refreshToken);

    final body = RefreshRequest(refreshToken: refreshToken);
    final response = await http
        .post(Uri.parse("https://laruina-java.herokuapp.com/refreshtoken"),
            body: jsonEncode(body), headers: HttpService.getHeaders(""))
        .whenComplete(() {});

    debugPrint(response.body);
    if (response.statusCode == 200) {
      final prefs = await StreamingSharedPreferences.instance;
      prefs.setString("user", response.body);
      return true;
    } else {
      throw NotAuthorizedException();
    }
  }
}

class NotAuthorizedException implements Exception {}
