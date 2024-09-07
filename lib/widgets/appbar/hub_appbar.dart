import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/widgets/appbar/app_bar_profile_button.dart';
import 'package:laruina/widgets/common/avatar.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class HubAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HubAppBar({super.key});

  @override
  State<HubAppBar> createState() => _HubAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HubAppBarState extends State<HubAppBar> {
  final cloudinary =
      CloudinaryPublic('ragingmmonkey', 'UPLOAD_PRESET', cache: false);
  User? user;

  Future<User> loadUser() async {
    final prefs = await StreamingSharedPreferences.instance;
    final parsed =
        jsonDecode(prefs.getString("user", defaultValue: "").getValue())
            .cast<String, dynamic>();
    final res = AuthResponse.fromJson(parsed).user;
    return res;
  }

  @override
  void initState() {
    super.initState();

    loadUser().then((value) {
      debugPrint(value.id);
      setState(() {
        user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        user == null
            ? Container()
            : AppBarProfileButton(
                user: user!,
                userAvatar:
                    UserAvatar(url: cloudinary.getImage("profiles/${user!.id}").url,))
      ],
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: Theme.of(context).iconTheme,
    );
  }
}
