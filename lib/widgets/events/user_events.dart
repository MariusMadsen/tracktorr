import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:laruina/contracts/event_contracts.dart';
import 'package:laruina/pages/hub/activities_page.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:laruina/widgets/common/avatar.dart';
import 'package:laruina/widgets/common/cover_card.dart';

class UserEvents extends StatelessWidget {
  UserEvents({super.key, required this.userEvents});

  final EventPair userEvents;

  final cloudinary =
      CloudinaryPublic('ragingmmonkey', 'UPLOAD_PRESET', cache: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              // ignore: prefer_const_constructors
              .push(
            RouteAnimationService.createRoute(
                page: ActivitiesPage(
                  userEvent: userEvents,
                ),
                offset: const Offset(0.0, 1.0),
                // ignore: prefer_const_constructors
                duration: Duration(milliseconds: 1250)),
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: UserAvatar(
                url:
                    cloudinary.getImage("profiles/${userEvents.friend.id}").url,
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: 100,
                height: 150,
                child: AbsorbPointer(
                  child: CarouselSlider(
                    items: userEvents.events
                        .map((e) => Row(
                              children: [
                                Expanded(child: Text(e.message)),
                                CoverCard(img: e.img!),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 150,
                      viewportFraction: 1,
                      scrollDirection: Axis.horizontal,
                      autoPlayCurve: Curves.easeOutExpo,
                      pageSnapping: true,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1500),
                      autoPlayInterval: const Duration(seconds: 5),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
