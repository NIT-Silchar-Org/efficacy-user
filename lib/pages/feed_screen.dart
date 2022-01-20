import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            EventTile(
              onPressed: () {
                Navigator.pushNamed(context, '/event_screen');
              },
              cardBannerUrl: 'assets/android_study_jams.png',
              gdscImageUrl: gdscImageUrl,
            ),
            EventTile(
              onPressed: () {},
              cardBannerUrl: 'assets/flutter_bootcamp.png',
              gdscImageUrl: gdscImageUrl,
            ),
            EventTile(
              onPressed: () {},
              cardBannerUrl: 'assets/android_study_jams.png',
              gdscImageUrl: gdscImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
