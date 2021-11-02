import 'dart:io';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/services/database.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/line.dart';
import 'dart:async';
import 'package:Efficacy/widgets/loaders/loader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final eventId = routeArgs['id'];

    return StreamProvider.value(
      value: DatabaseService(id: eventId).fetchEvent,
      child: EventDescription(),
    );
  }
}

class EventDescription extends StatefulWidget {
  @override
  _EventDescriptionState createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  Event buildEvent({Recurrence recurrence, EventCloud event}){
    return Event(
      title: event.title,
      description: event.about,
      location: event.venue,
      startDate: event.startTime,
      endDate: event.endTime,
    );
  }
  @override
  Widget build(BuildContext context) {
    EventCloud event = Provider.of<EventCloud>(context);
    if (event == null) {
      return Scaffold(
        body: Loader(),
      );
    } else {
      Future onSelectNotification(String payload) async {
        showDialog(
          context: context,
          builder: (_) {
            return new AlertDialog(
              title: Text(event.title),
              content: Text("Payload: $payload"),
            );
          },
        );
      }

      // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
      // var initializationSettingsAndroid =
      //     new AndroidInitializationSettings('@mipmap/ic_launcher');
      // var initializationSettingsIOS = new IOSInitializationSettings();
      // var initializationSettings = new InitializationSettings(
      //     android: initializationSettingsAndroid,
      //     iOS: initializationSettingsIOS);
      // flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
      // flutterLocalNotificationsPlugin.initialize(initializationSettings,
      //     onSelectNotification: onSelectNotification);
      // Future _scheduleNotification() async {
      //   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      //       'your channel id', 'your channel name', 'your channel description',
      //       importance: Importance.max, priority: Priority.high);
      //   var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
      //   var platformChannelSpecifics = new NotificationDetails();
      //   tz.initializeTimeZones();
      //   await flutterLocalNotificationsPlugin.zonedSchedule(
      //       0,
      //       event.title,
      //       event.about,
      //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      //       const NotificationDetails(
      //           android: AndroidNotificationDetails('your channel id',
      //               'your channel name', 'your channel description')),
      //       androidAllowWhileIdle: true,
      //       uiLocalNotificationDateInterpretation:
      //           UILocalNotificationDateInterpretation.absoluteTime);
      // }

      return StreamProvider.value(
        value: DatabaseService(id: event.clubId).fetchClub,
        child: Scaffold(
          // floatingActionButton: FloatingActionButton.extended(
          //     // icon: Icon(MdiIcons.pin),
          //     label: Text("Interested"),
          //     onPressed: () => {Add2Calendar.addEvent2Cal(buildEvent(event: event));},
          // ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                pinned: true,
                // title: Text(event.title),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  event.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                    child: Text(
                      event.title,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(
                        DateFormat.jm().format(event.startTime).toString() +
                            ", " +
                            DateFormat.MMMd().format(event.startTime) +
                            " to " +
                            DateFormat.jm().format(event.endTime).toString() +
                            ", " +
                            DateFormat.MMMd().format(event.endTime)),
                    leading: Icon(Icons.calendar_today),
                  ),
                  ListTile(
                    title: Text(event.venue),
                    leading: Icon(
                      Icons.location_on,
                    ),
                  ),
                  Line(L: 50, R: 50, T: 40, B: 40),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
                    child: Text(
                      "About",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
                    child: Text(
                      event.about.replaceAll('/n', '\n'),
                    ),
                  ),
                  Line(L: 50, R: 50, T: 30, B: 50),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
                    child: Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
                    child: Row(
                      children: [
                        FlatButton.icon(
                          icon: Icon(
                            MdiIcons.facebook,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            if (event.fbPostLink.length == 0) {
                              await launchURL(fallbackURLweb);
                            } else {
                              await launchURL(event.fbPostLink);
                            }
                          },
                          label: Text(
                            "Post",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            MdiIcons.google,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            if (event.googleFormLink.length == 0) {
                              await launchURL(fallbackURLweb);
                            } else {
                              await launchURL(event.googleFormLink);
                            }
                          },
                          label: Text(
                            "Google form",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.orangeAccent,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ClubFacebook(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: FlatButton(
                      color: Color(hexColor(BG)),
                      onPressed: () async {
                        if (event.fbPostLink.length == 0) {
                          await launchURL(fallbackURLweb);
                        } else {
                          await launchURL(event.fbPostLink);
                        }
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      );
    }
  }
}

class ClubFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Club c = Provider.of<Club>(context) ??
        Club(
            id: "unavailable",
            imageUrl: "unavailable",
            name: "unavailable",
            desc: "unavailable",
            fb: "unavailable");

    return Expanded(
        child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/oneClub", arguments: {"id": c.id});
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(c.imageUrl), fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          c.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          icon: Icon(
            MdiIcons.facebook,
            color: Colors.white,
          ),
          onPressed: () async {
            if (c.fb.length == 0) {
              await launchURL(fallbackURLweb);
            } else {
              await launchURL(c.fb);
            }
          },
          label: Text(
            "Follow",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Colors.blue,
        ),
        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
