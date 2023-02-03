import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:efficacy_user/models/event_model.dart';
import 'package:efficacy_user/provider/explore_screen_provider.dart';
import 'package:efficacy_user/utils/base_viewmodel.dart';
import 'package:efficacy_user/utils/enums.dart';
import 'package:efficacy_user/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/all_events.dart';
import '../themes/efficacy_usercolor.dart';
import '../widgets/filter_menu_item.dart';
import 'account_screen.dart';

// final Map<String, dynamic> json = {
//   "clubID": "94Pkmpbj0qzBCkiSQ6Yr",
//   "contacts": [
//     {
//       "position": "x. y. z",
//       "name": "Soumya Ranjan Mohapatro",
//       "phone": "9876543210"
//     }
//   ],
//   "description": "notification",
//   "duration": "Temporary",
//   "endTime": "2022-03-18T18:30:00.000Z",
//   "fbPostURL": "fb",
//   "googleFormURL": "gf",
//   "likeCount": 0,
//   "longDescription":
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc.",
//   "name": "Illuminits Event",
//   "posterURL":
//       "https://logos-world.net/wp-content/uploads/2020/06/ETSU-Buccaneers-emblem.jpg",
//   "startTime": "2022-02-18T18:30:00.000Z",
//   "usersWhoLiked": [],
//   "venue": "Teams",
//   "eventId": "yHZG2GhfYzQgS5MwDnzP",
//   "clubLogoURL":
//       'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg',
// };

// EventModel tempEvent = EventModel.fromJson(json);

class ExploreScreen extends StatefulWidget {
  static const route = 'explore_screen';
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // late ExploreScreenProvider exploreScreenProvider =
  //     Provider.of<ExploreScreenProvider>(context, listen: false);
  // bool isInit = true;
  // bool isLoading = false;
  List<AllEvent>? allevent;
  List<AllEvent>? events;
  List<String> filterOptions = ['Upcoming', 'Ongoing', 'Completed'];
  String selectedValue = 'Completed';
  // @override
  // void initState() {
  //   // exploreScreenProvider =Provider.of<ExploreScreenProvider>(context, listen: false);
  //   // exploreScreenProvider.fetchAllEvents(context: context);

  //   super.initState();
  // }

  String gdscImageUrl =
      'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg';

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
          'Explore',
          style: Theme.of(context).textTheme.headline1?.copyWith(
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
              child: CircleAvatar(
                backgroundColor: AppColorLight.secondary,
              ),
            ),
          )
        ],
      ),
      body: BaseView<ExploreScreenProvider>(
        onModelReady: (model) async {
          model.fetchAllEvents(context: context);
          allevent = model.allevents;
          allevent!.sort((a, b) {
            var adate = a.startTime;
            var bdate = b.startTime;
            return adate!.compareTo(bdate!);
          });
          filterEvents();
        },
        builder: (_, model, __) => model.state == ViewState.busy
            ? const Center(
                child: CircularProgressIndicator(),
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
                      child: ListView.builder(
                          itemCount: events?.length ?? 0,
                          itemBuilder: (context, index) {
                            return EventTile(
                              eventModel: events?[index],
                            );
                          }),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  void filterEvents() {
    events = allevent!.where((element) {
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
