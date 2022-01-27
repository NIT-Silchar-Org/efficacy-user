import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
    static const route='explore_screen';
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
