import 'dart:convert';

import 'package:efficacy_user/models/event_model.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';

final Map<String, dynamic> json = {
  "clubID": "94Pkmpbj0qzBCkiSQ6Yr",
  "contacts": [
    {
      "position": "x. y. z",
      "name": "Soumya Ranjan Mohapatro",
      "phone": "9876543210"
    }
  ],
  "description": "notification",
  "duration": "Temporary",
  "endTime": "2022-03-18T18:30:00.000Z",
  "fbPostURL": "fb",
  "googleFormURL": "gf",
  "likeCount": 0,
  "longDescription":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc.",
  "name": "Illuminits Event",
  "posterURL":
      "https://logos-world.net/wp-content/uploads/2020/06/ETSU-Buccaneers-emblem.jpg",
  "startTime": "2022-02-18T18:30:00.000Z",
  "usersWhoLiked": [],
  "venue": "Teams",
  "eventId": "yHZG2GhfYzQgS5MwDnzP",
};
EventModel tempEvent = EventModel.fromJson(json);

class ExploreScreen extends StatefulWidget {
  static const route = 'explore_screen';
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ongoing Events',
              style: Theme.of(context).textTheme.headline3?.copyWith(),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                for (int i = 0; i < 10; i++)
                  EventTile(
                    eventModel: tempEvent,
                  )
              ],
            ),
            EventTile(
              eventModel: tempEvent,
            ),
          ],
        ),
      ),
    );
  }
}
