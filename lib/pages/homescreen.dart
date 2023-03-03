import 'package:efficacy_user/pages/explore_screen.dart';
import 'package:efficacy_user/pages/feed_screen.dart';
import 'package:efficacy_user/pages/subscription_page.dart';
import 'package:efficacy_user/provider/google_signin_provider.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:efficacy_user/widgets/filter_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/explore_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> pageTitles = ['Feed', 'Explore', 'Profile'];
  List<Widget> screens = const [
    FeedScreen(),
    ExploreScreen(),
    SubscriptionPage(),
  ];
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';

  @override
  void initState() {
    super.initState();
    Provider.of<ExploreScreenProvider>(context, listen: false)
        .fetchAllEvents(context: context)
        .then((value) =>
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {});
            }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: Scaffold(
          body: screens[_selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              selectedFontSize: 20,
              unselectedItemColor: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  tooltip: 'Home',
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Explore',
                  icon: Icon(
                    Icons.explore_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Menu',
                  icon: Icon(
                    Icons.menu_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
