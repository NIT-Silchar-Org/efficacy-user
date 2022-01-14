// import 'package:efficacy_user/models/eventCloud.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  //String cardBannerUrl =
  //    'https://scontent.fgau4-1.fna.fbcdn.net/v/t39.30808-6/240820078_3519373158297668_146710064262806586_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=825194&_nc_ohc=Q5a-HvnCr6cAX8ntsnl&_nc_ht=scontent.fgau4-1.fna&oh=5ae2026a7153c9f565426b071e88f5a0&oe=61A78F7E';
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            shadowColor: Theme.of(context).appBarTheme.shadowColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            elevation: Theme.of(context).appBarTheme.elevation,
            title: Text(
              'Feed',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 24,
                  ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.notifications_none_rounded,
                          size: 30,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
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
          ),
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
                  label: 'Clubs',
                  icon: Icon(
                    Icons.people_alt_outlined,
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
