import 'package:efficacy_user/models/feed_screen_model.dart';
import 'package:efficacy_user/pages/explore_screen.dart';
import 'package:efficacy_user/provider/feedscreen_provider.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';
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
    engine = Provider.of<FeedscreenProvider>(context, listen: false);
    // getFeedScreen();
    super.initState();
    if (_controller.hasClients) {
      _controller.animateTo(-100,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
    }
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
        'SBwINoIKUukguKZrT3Wx',
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
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            for (int i = 0; i < 10; i++) EventTile(eventModel: tempEvent)
          ],
        ),
      ),
    );
  }
}
