import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/string_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class HttpService {
  HttpService._();
  static const String _baseUrl = "https://laruina-java.herokuapp.com/api/";

  static String getBaseUrl(String subDomain) {
    return _baseUrl + subDomain;
  }

  static Map<String, String> getHeaders(String token) {
    return {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
  }

  static Future<String?> getToken() async {
    String token = await StreamingSharedPreferences.instance
        .then((value) => value.getString("user", defaultValue: ""))
        .then((value) => value.getValue())
        .then((value) => jsonDecode(value))
        .then((value) => AuthResponse.fromJson(value))
        .then((value) => value.jwt)
        .onError((error, stackTrace) => "");
    if (token.isEmpty) {
      return null;
    }
    return token;
  }

  static Future<T> get<T>({
    required String url,
    Function? resp,
    String error = "Could not reach backend",
  }) async {
    var token = await getToken();
    logOutIfNoToken(token);

    var msg = "\n $url";

    final response =
        await http.get(Uri.parse(url), headers: HttpService.getHeaders(token!));

    if (response.statusCode == 200) {
      msg += "\n";
      debugPrint(msg);
      if (resp != null) {
        return resp(json.decode(StringService.safeString(response.body)));
      }
      return Future.value();
    }
    logOutIfUnAuthorized(response.statusCode);
    throw Exception("$msg $error: ${response.statusCode}\n");
  }

  static Future<T> post<T>({
    required String url,
    Function? resp,
    Function? refresh,
    String error = "Could not reach backend",
    Object? body,
    bool jsonfy = true,
  }) async {
    var token = await getToken();
    logOutIfNoToken(token);

    var msg = "\n $url";

    final response = await http
        .post(
      Uri.parse(url),
      headers: HttpService.getHeaders(token!),
      body: json.encode(body),
    )
        .whenComplete(() {
      if (refresh != null) {
        refresh();
      }
    });

    if (response.statusCode == 200) {
      msg += "\n";
      debugPrint(msg);
      if (resp != null) {
        var responseBody = jsonfy
            ? json.decode(StringService.safeString(response.body))
            : StringService.safeString(response.body);
        return resp(responseBody);
      }
      return Future.value();
    }
    logOutIfUnAuthorized(response.statusCode);
    throw Exception("$msg $error: ${response.statusCode}\n");
  }

  static Future<T> put<T>({
    required String url,
    Function? resp,
    Function? refresh,
    String error = "Could not reach backend",
    Object? body,
  }) async {
    var msg = "\n $url";
    var token = await getToken();
    logOutIfNoToken(token);

    final response = await http
        .put(
      Uri.parse(url),
      headers: HttpService.getHeaders(token!),
      body: json.encode(body),
    )
        .whenComplete(() {
      if (refresh != null) {
        refresh();
      }
    });

    if (response.statusCode == 200) {
      msg += "\n";
      debugPrint(msg);
      if (resp != null) {
        return resp(json.decode(StringService.safeString(response.body)));
      }
      return Future.value();
    }
    logOutIfUnAuthorized(response.statusCode);
    throw Exception("$msg$error: ${response.statusCode}\n");
  }
}

void logOutIfNoToken(String? token) async {
  if (token == null) {
    await SharedPreferences.getInstance().then((value) => value.remove("user"));
  }
}

void logOutIfUnAuthorized(int statusCode) async {
  if (statusCode == 403) {
    await SharedPreferences.getInstance().then((value) => value.remove("user"));
  }
}
