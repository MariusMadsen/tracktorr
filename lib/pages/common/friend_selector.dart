import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:laruina/provider/friends_model.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/avatar.dart';
import 'package:provider/provider.dart';

class FriendSelector extends StatefulWidget {
  const FriendSelector({super.key});

  @override
  State<FriendSelector> createState() => _FriendSelectorState();
}

class _FriendSelectorState extends State<FriendSelector> {
  @override
  Widget build(BuildContext context) {
    final friendsModel = context.read<FriendsModel>();
    friendsModel.initialFetch();

    final moviesModel = context.read<MoviesModel>();

    final cloudinary =
        CloudinaryPublic('ragingmmonkey', 'UPLOAD_PRESET', cache: false);

    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<FriendsModel>(
          builder: (context, value, child) {
            var friends = value.userFriends.friends.toList();
            friends.sort((a, b) =>
                a.username.toLowerCase().compareTo(b.username.toLowerCase()));
            return ListView(children: [
              const Text(
                "Select friends",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: friends
                    .map(
                      (e) => FilterChip(
                        
                        selectedColor: ThemeColors.yes(),
                        selected: moviesModel.friends.contains(e),
                        onSelected: (value) {
                          setState(() {
                            if (value) {
                              moviesModel.friends.add(e);
                            } else {
                              moviesModel.friends.remove(e);
                            }
                          });
                        },
                        backgroundColor: ThemeColors.accent(),
                        avatar: UserAvatar(
                            size: 25,
                            url: cloudinary.getImage("profiles/${e.id}").url),
                        label: Text(
                          e.username,
                          style: TextStyle(
                              fontSize: 18, color: ThemeColors.text()),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.accent(),
                      textStyle: TextStyle(color: ThemeColors.text())),
                  onPressed: () {
                    moviesModel.refresh();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Apply",
                    style: TextStyle(color: ThemeColors.text()),
                  ))
            ]);
          },
        ),
      ),
    );
  }
}
