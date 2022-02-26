import 'package:efficacy_user/models/feed_screen_model.dart';
import 'package:efficacy_user/provider/feedscreen_provider.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/pages/event_screen.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  static const route = 'feed_screen';
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late FeedscreenProvider engine;
  bool isInit = true;
  bool isLoading = false;
  final ScrollController _controller = ScrollController();
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';

  @override
  void initState() {
    engine = Provider.of<FeedscreenProvider>(context);
    getFeedScreen();
    super.initState();
    _controller.animateTo(-100,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  void _animateup() {
    _controller.animateTo(-100,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * 100,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
    );
  }

  late FeedScreenModel engineVar;

  void getFeedScreen() async {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      engineVar = await engine.fetchfeed([
        'wqvJ98qg2sa1X23gRmVX',
      ]);
      setState(() {
        isLoading = false;
      });
      print(engineVar);
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
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
                            return EventScreen(eventId: engineVar.eventID);
                          },
                          transitionDuration:
                              const Duration(milliseconds: 1200),
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
