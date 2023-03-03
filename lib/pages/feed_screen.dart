import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:efficacy_user/models/all_events.dart';
import 'package:efficacy_user/models/client_user_model.dart';
import 'package:efficacy_user/provider/feedscreen_provider.dart';
import 'package:efficacy_user/utils/base_viewmodel.dart';
import 'package:efficacy_user/utils/enums.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../provider/explore_screen_provider.dart';
import '../themes/efficacy_usercolor.dart';
import '../widgets/filter_menu_item.dart';
import 'account_screen.dart';

class FeedScreen extends StatefulWidget {
  static const route = 'feed_screen';
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // late FeedscreenProvider engine;
  // bool isInit = true;
  // bool isLoading = false;
  // final ScrollController _controller = ScrollController();
  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';
  String selectedValue = 'Upcoming';
  List<String> filterOptions = ['Upcoming', 'Ongoing', 'Completed'];
  List<String>? clubList;

  // @override
  // void initState() {
  //   engine = Provider.of<FeedscreenProvider>(context, listen: false);
  //   // getFeedScreen();
  //   super.initState();
  //   if (_controller.hasClients) {
  //     _controller.animateTo(-100,
  //         duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  //   }
  // }

  // void _animateup() {
  //   _controller.animateTo(-100,
  //       duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  // }

  // void _animateToIndex(int index) {
  //   _controller.animateTo(
  //     index * 100,
  //     duration: const Duration(milliseconds: 1000),
  //     curve: Curves.easeIn,
  //   );
  // }

  late List<AllEvent>? allEvent;
  List<AllEvent>? events;

  // void getFeedScreen() async {
  //   if (isInit) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     engineVar = await engine.fetchfeed([
  //       'SBwINoIKUukguKZrT3Wx',
  //     ]);
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print(engineVar);
  //     isInit = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        shadowColor: Theme.of(context).appBarTheme.shadowColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        title: Text(
          'Feed',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 24,
              ),
        ),
        actions: [
          DropdownButtonHideUnderline(
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
                  filterEvents();
                });
              },
              itemHeight: size.height * 0.05,
              dropdownWidth: size.width * 0.6,
              dropdownPadding: const EdgeInsets.symmetric(vertical: 20),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              offset: Offset(size.width * -0.30, 0),
              dropdownOverButton: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, anotherAnimation) {
                      return const AccountScreen();
                    },
                    transitionDuration: const Duration(milliseconds: 1200),
                    transitionsBuilder:
                        (context, animation, anotherAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.easeIn, parent: animation);
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    }));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.person_outline,
                    size: 30,
                    color: Theme.of(context).primaryIconTheme.color,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: BaseView<FeedscreenProvider>(
        onModelReady: (model) async {
          await FirebaseFirestore.instance
              .collection('clientUser')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get()
              .then((value) => {
                    clubList =
                        ClientUserModel.fromJson(value.data()!).subscriptions
                  });
          model.fetchAllEvents(context: context, clubList: clubList);
          allEvent = model.allevents;
          allEvent!.sort((a, b) {
            var adate = a.startTime;
            var bdate = b.startTime;
            return adate!.compareTo(bdate!);
          });
          filterEvents();
        },
        builder: (_, model, __) {
          filterEvents();
          return model.state == ViewState.busy
              ? Center(
                  child: Lottie.asset("lottie/loading.json",
                      height: MediaQuery.of(context).size.height * 0.3),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          ' $selectedValue Events',
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: events?.length == 0
                            ? Center(
                                child: Lottie.asset("lottie/noEvent.json"),
                              )
                            : ListView.builder(
                                itemCount: events?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return EventTile(
                                    eventModel: events?[index],
                                  );
                                }),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }

  void filterEvents() {
    events = allEvent!.where((element) {
      var startDate = element.startTime;
      var endDate = element.startTime;
      if (selectedValue == 'Upcoming') {
        return startDate!.isAfter(DateTime.now());
      } else if (selectedValue == 'Ongoing') {
        return startDate!.isBefore(DateTime.now()) &&
            endDate!.isAfter(DateTime.now());
      } else {
        return endDate!.isBefore(DateTime.now());
      }
    }).toList();
  }
}
