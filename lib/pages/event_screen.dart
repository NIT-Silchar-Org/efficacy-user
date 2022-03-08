import 'package:efficacy_user/models/event_model.dart';
import 'package:efficacy_user/provider/event_provider.dart';
import 'package:efficacy_user/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:efficacy_user/pages/club_details.dart';
import 'package:efficacy_user/widgets/details_widget.dart';
import 'package:efficacy_user/widgets/detail_card.dart';
import 'package:efficacy_user/widgets/moderator.dart';
import 'package:efficacy_user/widgets/add_to_calender.dart';
import 'package:efficacy_user/widgets/like_widget.dart';
import 'package:efficacy_user/widgets/share_widget.dart';
import 'package:efficacy_user/widgets/follow_widget.dart';
import 'package:efficacy_user/widgets/facebook_widget.dart';
import 'package:efficacy_user/widgets/gform_widget.dart';

class EventScreen extends StatefulWidget {
  final String? eventId;
  static const route = '/event_screen';
  const EventScreen({
    Key? key,
    this.eventId,
  }) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late EventProvider engine;
  bool isInit = true;
  bool isLoading = false;

  int _selectedIndex = 0;
  BorderRadiusGeometry sheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  void initState() {
    engine = Provider.of<EventProvider>(context);
    getEvent();
    super.initState();
  }

  late EventModel engineVar;

  void getEvent() async {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      engineVar = await engine.fetchEvent(widget.eventId!);
      setState(() {
        isLoading = false;
      });
    }
    print(engineVar);
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SlidingUpPanel(
              maxHeight: devicesize.height,
              minHeight: devicesize.height * 0.60,
              panelBuilder: (sc) => Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  shrinkWrap: true,
                  controller: sc,
                  children: [
                    const PanelDivider(),
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
                                  engineVar.clubLogoURL!,
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
                                        color: const Color(0xff191C1D)
                                            .withOpacity(0.7),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    engineVar.clubName!,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: const Color(0xff191C1D)
                                            .withOpacity(0.7),
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
                            engineVar.eventName!,
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
                              children: const [
                                Like(),
                                Share(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    DetailCard(
                        text1: engineVar.startTime.toString().split(' ')[0],
                        text2:
                            '${engineVar.startTime.toString().split(' ')[1]} to ${engineVar.endTime.toString().split(' ')[1]}',
                        icon: Icons.calendar_today_outlined),
                    DetailCard(
                        text1: engineVar.venue!,
                        text2: "On Campus",
                        icon: Icons.location_on_outlined),
                    const Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: AddToCalender(),
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
                    DetailsWidget(text: engineVar.longDescription!),
                    Container(
                      margin: const EdgeInsets.only(top: 29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [Gform(), Facebook()],
                      ),
                    ),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        engineVar.contact!.length,
                        (index) => Column(
                          children: [
                            Moderator(
                              text1: engineVar.contact![index].name,
                              text2: engineVar.contact![index].position,
                              icon: Icons.person,
                            ),
                            DetailCard(
                              text1: engineVar.contact![index].phNumber,
                              icon: Icons.call_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
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
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(engineVar.posterURL!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 25.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home_screen');
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffDFE5E7).withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
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
