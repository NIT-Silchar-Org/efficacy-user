import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:group_radio_button/group_radio_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 0;
  BorderRadiusGeometry sheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  Widget infoFun(String s1, String s2) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s1,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: const Color(0xff191C1D).withOpacity(0.5),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s2,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xff191C1D).withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 1,
                  color: const Color(0xff191C1D).withOpacity(0.2),
                  child: const Divider(),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: devicesize.height,
        minHeight: devicesize.height * 0.65,
        panelBuilder: (sc) => Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              shrinkWrap: false,
              controller: sc,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Divider(
                    color: const Color(0xff180000).withOpacity(0.17),
                    height: 20,
                    thickness: 2,
                    indent: 100,
                    endIndent: 100,
                  ),
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(color: Color(0xff213F8D), fontSize: 22),
                ),
                infoFun('Name', 'Lorem Ipsum'),
                infoFun('Scholar ID', '2012***'),
                infoFun('Year ', '2021'),
                infoFun('Branch ', 'CSE'),
                infoFun('Degree', 'BTECH'),
                infoFun('Email', 'ashas@gmail.com'),
                infoFun('Phone No.', '8203887***'),
                const Text(
                  'Theme',
                  style: TextStyle(color: Color(0xff213F8D), fontSize: 22),
                ),
                Row(
                  children: [
                    RadioButton(
                      description: "Dark",
                      value: "Dark",
                      onChanged: (S) {
                        setState(() {});
                      },
                      groupValue: 2,
                    ),
                    RadioButton(
                      description: "Light",
                      value: "Light",
                      onChanged: (S) {},
                      groupValue: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //collapsed: null,
        //defaultPanelState: PanelState.OPEN,
        body: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.blue[900],
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  radius: 45,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem Ipsum',
                  style: TextStyle(color: AppColorLight.primary, fontSize: 20),
                )
              ],
            ),
          ),
        )),
        borderRadius: sheetRadius,
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
    );
  }
}
