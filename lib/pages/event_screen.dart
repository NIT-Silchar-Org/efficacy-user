// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gdsc_android.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: SolidBottomSheet(
        showOnAppear: true,
        // canUserSwipe: false,
        maxHeight: MediaQuery.of(context).size.height - 300,
        headerBar: Divider(
          color: const Color(0xff180000).withOpacity(0.17),
          height: 20,
          thickness: 2,
          indent: 150,
          endIndent: 150,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Image.network(
                            'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg',
                            fit: BoxFit.cover),
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
                  Container(
                    width: 61,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xffDAE5FF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.add_to_photos_outlined,
                          size: 10,
                          color: Color(0xff213F8D),
                        ),
                        Text(
                          "Follow",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color(0xff213F8D),
                              fontSize: 10.0,
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
                        children: [
                          const Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 16,
                            color: Color(0xff213F8D),
                          ),
                          const Icon(
                            Icons.share_outlined,
                            size: 16,
                            color: Color(0xff213F8D),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 21),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFF0B6)),
                      child: const Center(
                        child: Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: Color(0xffFECC07),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fri, 20 March, 2021",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.7),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            "6:00 PM to 7:00 PM",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.5),
                                fontSize: 8.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 21),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFF0B6)),
                      child: const Center(
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Color(0xffFECC07),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NIT Silchar",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.7),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            "On Campus",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.5),
                                fontSize: 8.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 114,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffDAE5FF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.event_note_outlined,
                      size: 10,
                      color: Color(0xff213F8D),
                    ),
                    Text(
                      "Add to Calender",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xff213F8D),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
              Container(
                margin: const EdgeInsets.only(top: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      shadowColor: AppColorLight.cardShadow,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        width: 125,
                        height: 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/google.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "Google Form",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color(0xFFFECC07),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: AppColorLight.cardShadow,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        width: 125,
                        height: 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.facebook,
                              size: 22,
                              color: Color(0xff1877F2),
                            ),
                            Text(
                              "Facebook",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color(0xff213f8d),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 21),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 32,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Random Name",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.7),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            "Moderator",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.5),
                                fontSize: 8.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFF0B6)),
                      child: const Center(
                        child: Icon(
                          Icons.call_outlined,
                          size: 14,
                          color: Color(0xffFECC07),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "9876543210",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xff191C1D).withOpacity(0.7),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 12),
              //   child: Text(
              //     "published on 12 March,2021",
              //     style: GoogleFonts.poppins(
              //       textStyle: TextStyle(
              //           color: const Color(0xff191C1D).withOpacity(0.7),
              //           fontSize: 8.0,
              //           fontWeight: FontWeight.w300,
              //           letterSpacing: 0.5,
              //           fontStyle: FontStyle.italic),
              //     ),
              //   ),
              // )
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
