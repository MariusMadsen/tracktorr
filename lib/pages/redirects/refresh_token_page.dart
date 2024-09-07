import 'package:flutter/material.dart';
import 'package:laruina/pages/hub/hub_page.dart';
import 'package:laruina/pages/hub/login_page.dart';
import 'package:laruina/services/auth_service.dart';
import 'package:laruina/statics/colors.dart';

class RefreshTokenPage extends StatelessWidget {
  const RefreshTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final future = AuthService.refreshToken();
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return const HubPage();
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
