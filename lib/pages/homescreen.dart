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
  String cardBannerUrl =
      'https://scontent.fgau4-1.fna.fbcdn.net/v/t39.30808-6/240820078_3519373158297668_146710064262806586_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=825194&_nc_ohc=Q5a-HvnCr6cAX8ntsnl&_nc_ht=scontent.fgau4-1.fna&oh=5ae2026a7153c9f565426b071e88f5a0&oe=61A78F7E';
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
            backgroundColor: AppColorLight.background,
            shadowColor: AppColorLight.background,
            foregroundColor: Colors.black,
            elevation: 0,
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
                          color: AppColorLight.mainText,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColorLight.primary,
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
                    cardBannerUrl: cardBannerUrl,
                    gdscImageUrl: gdscImageUrl,
                  ),
                  EventTile(
                    cardBannerUrl: cardBannerUrl,
                    gdscImageUrl: gdscImageUrl,
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColorLight.background,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColorLight.mainText,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColorLight.mainText,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Clubs',
                icon: Icon(
                  Icons.people_alt_outlined,
                  color: AppColorLight.mainText,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Explore',
                icon: Icon(
                  Icons.explore_outlined,
                  color: AppColorLight.mainText,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Menu',
                icon: Icon(
                  Icons.menu_rounded,
                  color: AppColorLight.mainText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
