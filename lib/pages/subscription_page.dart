import 'package:efficacy_user/widgets/subscribe_button.dart';
import 'package:efficacy_user/widgets/subscription_tab_buttons.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter_portal/flutter_portal.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int _selectedIndex = 0;
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Portal(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColorLight.background,
          title: Text(
            'Subscriptions',
            style: TextStyle(color: AppColorLight.mainText),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              width: size.width,
              height: size.height * 0.1,
              color: AppColorLight.primary,
              child: PortalEntry(
                visible: isMenuOpen,
                portalAnchor: Alignment.topLeft,
                childAnchor: Alignment.bottomLeft,
                portal: Material(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  elevation: 8,
                  child: IntrinsicWidth(
                    stepWidth: size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SubscriptionTabButton(title: 'All Clubs'),
                        SubscriptionTabButton(title: 'Subscribed Clubs'),
                        SubscriptionTabButton(title: 'Unsubscribed Clubs'),
                      ],
                    ),
                  ),
                ),
                child: TextButton(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Filters',
                        style: TextStyle(
                            color: AppColorLight.mainText,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColorLight.mainText),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Icon(
                          Icons.filter_list_outlined,
                          color: AppColorLight.mainText,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      if (isMenuOpen) {
                        isMenuOpen = false;
                      } else {
                        isMenuOpen = true;
                      }
                    });
                  },
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Illuminatis'),
                      trailing: TextButton(
                        child: SizedBox(
                            width: (size.width * 0.3), child: Subscribe()),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            elevation: 2,
            backgroundColor: AppColorLight.background,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColorLight.secondary,
            selectedFontSize: 20,
            unselectedItemColor: const Color(0xFF7D7D7D).withOpacity(0.5),
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
    ));
  }
}
