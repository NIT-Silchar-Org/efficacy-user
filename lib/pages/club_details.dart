import 'package:efficacy_user/models/club_model.dart';
import 'package:efficacy_user/provider/club_provider.dart';
import 'package:efficacy_user/widgets/bell_notification.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:efficacy_user/widgets/expand_text.dart';
import 'package:efficacy_user/widgets/subscribe_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ClubDetail extends StatefulWidget {
  final String? clubId;
  static const route = 'club_detail';
  const ClubDetail({
    Key? key,
    this.clubId,
  }) : super(key: key);

  @override
  _ClubDetailState createState() => _ClubDetailState();
}

class _ClubDetailState extends State<ClubDetail>
    with SingleTickerProviderStateMixin {
  late ClubProvider engine;
  bool isInit = true;
  bool isLoading = true;
  late TabController _controller;
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';
  final text =
      "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s,when an unknown printer took a galleyof type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leapinto electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

  @override
  void initState() {
    engine = Provider.of<ClubProvider>(context);
    getClub();
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  late ClubModel engineVar;

  void getClub() async {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      engineVar = await engine.fetchClub(widget.clubId!);
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
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SlidingUpPanel(
                panelBuilder: (sc) => Padding(
                  padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 44,
                            height: 44,
                            child: Image.network(engineVar.clubLogoURL,
                                fit: BoxFit.cover),
                          ),
                          const Bell(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            engineVar.clubName,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Subscribe(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: TabBar(
                          controller: _controller,
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 3.0,
                              color: Color.fromRGBO(24, 0, 0, 0.17),
                            ),
                            insets: EdgeInsets.symmetric(horizontal: 35.0),
                          ),
                          // indicatorWeight: 0,
                          labelColor: const Color.fromRGBO(25, 28, 29, 0.7),
                          tabs: const [
                            Tab(
                              text: 'About',
                            ),
                            Tab(
                              text: 'Events',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Center(
                              child: ListView(
                                controller: sc,
                                children: [
                                  ExpandText(text: text),
                                  const SizedBox(height: 20),
                                  const Text('Socials'),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const FaIcon(
                                          FontAwesomeIcons.facebook,
                                          color: Color(0xFF185BCE),
                                          size: 24,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const FaIcon(
                                          FontAwesomeIcons.instagram,
                                          color: Color(0xFFFF0000),
                                          size: 24,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text('Contact'),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: List.generate(
                                      engineVar.moderators.length,
                                      (index) => SizedBox(
                                        width: devicesize.width / 3,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: devicesize.height / 7,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/moderator.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              engineVar.moderators[index].name,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              engineVar
                                                  .moderators[index].position,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView(
                              children: [
                                EventTile(
                                  onPressed: () {},
                                  cardBannerUrl:
                                      'assets/android_study_jams.png',
                                  gdscImageUrl: gdscImageUrl,
                                ),
                                EventTile(
                                  onPressed: () {},
                                  cardBannerUrl: 'assets/flutter_bootcamp.png',
                                  gdscImageUrl: gdscImageUrl,
                                ),
                                EventTile(
                                  onPressed: () {},
                                  cardBannerUrl:
                                      'assets/android_study_jams.png',
                                  gdscImageUrl: gdscImageUrl,
                                ),
                              ],
                            ),
                          ],
                          controller: _controller,
                        ),
                      ),
                    ],
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                minHeight: devicesize.height * 0.75,
                maxHeight: devicesize.height,
                body: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        width: devicesize.width,
                        height: devicesize.height * 0.28,
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
              ),
        //bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
