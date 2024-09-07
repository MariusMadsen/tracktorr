import 'package:flutter/material.dart';
import 'package:laruina/provider/events_provider.dart';
import 'package:laruina/widgets/events/user_events.dart';
import 'package:provider/provider.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = context.read<EventModel>();
    activities.get();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text.rich(
            TextSpan(
              text: "WHATS HAPPENING",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Consumer<EventModel>(
          builder: (context, value, child) => Column(
            children: value.events
                .map((e) => UserEvents(userEvents: e))
                .toList(),
          ),
        ),
        const Divider()
      ],
    );
  }
}
