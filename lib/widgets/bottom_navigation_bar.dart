import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0x01EEEEEE),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff00829B),
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
    );
  }
}
