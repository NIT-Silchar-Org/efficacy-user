import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SideBar extends StatelessWidget {
  List<Club> clubList;
  SideBar({this.clubList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/efficacy_logo.jpg"),
              )),
              title: Text(
                "Efficacy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Line(L: 0, R: 0, T: 0, B: 0),

        ExpansionTile(
          title: Text(
            "Clubs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.people_outline),
          children: clubList.map((e) {
            return ListTile(
                title: Text(
                  e.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  print(e.id);
                  Navigator.of(context).pushNamed("/oneClub", arguments: {
                    "id": e.id,
                  });
                });
          }).toList(),
        ),
        // ListTile(
        //   leading: Icon(Icons.settings),
        //   title: Text(
        //     'Settings',
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        //   onTap: () {},
        // ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text(
            'About Us',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/about_us");
          },
        ),

        // Container(
        //     child: Column(
        //   children:
        // ))
      ],
    );
  }
}
