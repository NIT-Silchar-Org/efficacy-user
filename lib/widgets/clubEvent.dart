import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/screens/eventScreen.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/loaders/imageLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Efficacy/models/event.dart';
import 'dart:math';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ClubEventTile extends StatelessWidget {
  EventCloud event;
  ClubEventTile({this.event});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Event Id" + event.id);
        Navigator.of(context).pushNamed("/event", arguments: {"id": event.id});
      },
      child: ClipRRect(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  ImageLoader(),
                  Container(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: Image.network(
                      event.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                          child: Text(
                            event.title,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 14, 0, 14),
                          child: Text(
                            DateFormat.jm().format(event.startTime) +
                                " | " +
                                DateFormat.MMMd().format(event.startTime),

                            // DateFormat.jm().format(event.startTime),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      //Date
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // ignore: deprecated_member_use
                          Container(
                            child: InkWell(
                              // padding: EdgeInsets.symmetric(horizontal: 100.0),
                              child: new Icon(Icons.info_outline, color: Colors.blueAccent,size: 36,),
                              onTap: () {
                                Navigator.of(context).pushNamed("/event",
                                    arguments: {"id": event.id});
                              },
                            ),
                          ),

                          // Text(
                          //   "startTime",

                          //   // DateFormat.jm().format(event.startTime),
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.blueAccent,
                          //   ),
                          // ),

                          // Text(
                          //   // DateFormat.yMMMEd().format(event.startTime) ,

                          //   DateFormat.jm().format(event.startTime),
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.black87,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
