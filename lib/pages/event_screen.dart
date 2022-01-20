// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:efficacy_user/pages/club_details.dart';
import 'package:efficacy_user/widgets/details_widget.dart';
import 'package:efficacy_user/widgets/detail_card.dart';
import 'package:efficacy_user/widgets/moderator.dart';
import 'package:efficacy_user/utils/add_to_calender.dart';
import 'package:efficacy_user/utils/like_widget.dart';
import 'package:efficacy_user/utils/share_widget.dart';
import 'package:efficacy_user/utils/follow_widget.dart';
import 'package:efficacy_user/utils/facebook_widget.dart';
import 'package:efficacy_user/utils/gform_widget.dart';

class EventScreen extends StatefulWidget {
    static const route='/event_screen';
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
  int _selectedIndex = 0;
  BorderRadiusGeometry sheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: devicesize.height,
        minHeight: devicesize.height * 0.60,
        panelBuilder: (sc) => Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            shrinkWrap: true,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ClubDetail.route);
                        },
                        child: SizedBox(
                          width: 44,
                          height: 44,
                          child: Image.network(
                            'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Organized by",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color:
                                      const Color(0xff191C1D).withOpacity(0.7),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Text(
                              "Google Developer Student Clubs",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color:
                                      const Color(0xff191C1D).withOpacity(0.7),
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Follow()
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Android Study Jams",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: const Color(0xff191C1D).withOpacity(0.7),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 61,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Like(), const Share()],
                      ),
                    )
                  ],
                ),
              ),
              DetailCard(
                  text1: "Fri, 20 March, 2021",
                  text2: "6:00 PM to 7:00 PM",
                  icon: Icons.calendar_today_outlined),
              DetailCard(
                  text1: "NIT Silchar",
                  text2: "On Campus",
                  icon: Icons.location_on_outlined),
              const AddToCalender(),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  "Event Details",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xff191C1D).withOpacity(0.7),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              DetailsWidget(text: description),
              Container(
                margin: const EdgeInsets.only(top: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Gform(), const Facebook()],
                ),
              ),
              Moderator(
                  text1: "Random Name", text2: "Moderator", icon: Icons.person),
              DetailCard(text1: "9876543210", icon: Icons.call_outlined),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 20),
                child: Text(
                  "published on 12 March,2021",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: const Color(0xff191C1D).withOpacity(0.7),
                        fontSize: 8.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gdsc_android.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
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
