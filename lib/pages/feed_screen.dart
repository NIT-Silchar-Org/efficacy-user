import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/pages/event_screen.dart';

class FeedScreen extends StatefulWidget {
    static const route='feed_screen';
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final ScrollController _controller = ScrollController();
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.animateTo(-100,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  void _animateup() {
    _controller.animateTo(-100,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * 100,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            EventTile(
              onPressed: () {
                _animateToIndex(10);
                // Navigator.pushNamed(context, '/event_screen');
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, anotherAnimation) {
                      return EventScreen();
                    },
                    transitionDuration: Duration(milliseconds: 1200),
                    transitionsBuilder:
                        (context, animation, anotherAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.easeIn, parent: animation);
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    }));
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
            EventTile(
              onPressed: () {
                _animateup();
              },
              cardBannerUrl: 'assets/flutter_bootcamp.png',
              gdscImageUrl: gdscImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
