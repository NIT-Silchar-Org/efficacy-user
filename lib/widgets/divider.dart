import 'package:flutter/material.dart';

class PanelDivider extends StatelessWidget {
  const PanelDivider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 10),
      child: Divider(
        color: const Color(0xff180000).withOpacity(0.27),
        height: 20,
        thickness: 2.5,
        indent: devicesize.width*.3,
        endIndent: devicesize.width*.3,
      ),
    );
  }
}
