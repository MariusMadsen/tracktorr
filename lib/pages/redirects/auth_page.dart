import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/main.dart';
import 'package:laruina/pages/hub/hub_page.dart';
import 'package:laruina/pages/hub/login_page.dart';
import 'package:laruina/pages/redirects/refresh_token_page.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.settings});
  final MyAppSettings settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferenceBuilder<String>(
        preference: settings.user,
        builder: (context, userJson) {
          if (userJson.isNotEmpty) {
            final parsed = jsonDecode(userJson).cast<String, dynamic>();

            final authResponse = AuthResponse.fromJson(parsed);
            final ttl = authResponse.ttl;
            var date = DateTime.fromMillisecondsSinceEpoch(ttl);
            debugPrint("$date");
            debugPrint(authResponse.jwt);
            if (DateTime.now().isBefore(date)) {
              return const HubPage();
            }
            debugPrint("The ttl has expired, attempting refresh");
            return const RefreshTokenPage();
          } else {
            debugPrint("userJson is empty");
          }
          return const LoginPage();
        },
      ),
    );
  }
}
