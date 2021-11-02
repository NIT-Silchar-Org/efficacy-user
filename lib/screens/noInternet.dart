import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   title: Text(""),
      // ),
      body: Center(
        child: Column(
          children: [
            Icon(
              MdiIcons.wifiOff,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Oh no!",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "No internet connection",
              style: TextStyle(fontSize: 18.0),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
