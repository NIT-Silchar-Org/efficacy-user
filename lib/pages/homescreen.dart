import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:efficacy_user/pages/explore_screen.dart';
import 'package:efficacy_user/pages/feed_screen.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:efficacy_user/widgets/filter_menu_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String selectedValue = 'Upcoming';
  List<String> pageTitles = ['Feed', 'Clubs', 'Explore', 'Profile'];
  List<String> filterOptions = ['Upcoming', 'Ongoing', 'Completed'];
  List<Widget> screens = const [
    FeedScreen(),
    Text('clubs page'),
    ExploreScreen(),
    Text('accounts page'),
  ];
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
              pageTitles[_selectedIndex],
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 24,
                  ),
            ),
            actions: [
              Visibility(
                visible: _selectedIndex == 2,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                            color: Theme.of(context).primaryIconTheme.color,
                          ),
                        ),
                      ),
                    ),
                    items: filterOptions
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: FilterMenuItem(
                              text: item,
                              isSelected: selectedValue == item,
                            )))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                      });
                    },
                    itemHeight: size.height * 0.05,
                    //itemWidth: size.width * 0.5,
                    dropdownPadding: const EdgeInsets.symmetric(vertical: 20),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    offset: Offset(size.width * -0.35, 0),
                    dropdownOverButton: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: AppColorLight.secondary,
                ),
              )
            ],
          ),
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
