import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/services/database.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/adminTiles.dart';
import 'package:Efficacy/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    Key key,
    @required this.club,
  }) : super(key: key);

  final Club club;

  @override
  Widget build(BuildContext context) {
    print("Club ID" + club.id);
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Text(
          club.name,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
        child: Text(
          "About Us",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
        child: Text(
          club.desc.replaceAll('/n', '\n'),
        ),
      ),
      Line(L: 50, R: 50, T: 25, B: 25),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Text(
          "Social Links",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 15, 25),
        child: Row(children: [
          IconButton(
              icon: Icon(
                MdiIcons.facebook,
                color: Colors.blue,
              ),
              onPressed: () async {
                if (club.fb.length == 0) {
                  await launch(fallbackURLweb);
                } else {
                  await launch(club.fb);
                }
              }),

          // IconButton(
          //     icon: Icon(
          //       MdiIcons.instagram,
          //       color: Colors.pink,
          //     ),
          //     onPressed: () {}),
          // IconButton(
          //     icon: Icon(
          //       MdiIcons.twitter,
          //       color: Colors.lightBlue,
          //     ),
          //     onPressed: () {}),
        ]),
      ),
      Line(L: 50, R: 50, T: 25, B: 25),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Text(
          "People",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
        child: MultiProvider(
          providers: [
            StreamProvider.value(
                value: DatabaseService(id: club.id).adminsPerClub),
          ],
          child: AdminTiles(),
        ),
      ),

      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     margin: EdgeInsets.fromLTRB(15, 25, 15, 25),
      //     height: 200.0,
      //     child: ListView(
      //       scrollDirection: Axis.horizontal,
      //       children: <Widget>[
      //         Card(
      //           child: Container(
      //             width: 160.0,
      //             child: Column(
      //               children: [
      //                 Expanded(
      //                   child: Row(
      //                       children: [Expanded(child: Icon(Icons.person))]),
      //                 ),
      //                 Text("Admin")
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ]));
  }
}
