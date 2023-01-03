import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Subscribe extends StatefulWidget {
  // const Subscribe({Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  bool subscribe_button_state = true;
  bool bell_icon_state = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(3),
            height: 40,
            width: 85,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorLight.primary,
                width: 0.0,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(7),
                topLeft: Radius.circular(7),
              ),
              color: subscribe_button_state == true
                  ? AppColorLight.primary
                  : Colors.grey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Subscribe',
                  style: TextStyle(
                    color: subscribe_button_state == true
                        ? Color.fromRGBO(33, 63, 141, 1)
                        : Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              subscribe_button_state = !subscribe_button_state;
            });
          },
        ),
        Container(
          height: 40,
          width: 1,
          decoration: BoxDecoration(color: Colors.white),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(3),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorLight.primary,
                width: 0.0,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
              color:
                  bell_icon_state == true ? AppColorLight.primary : Colors.grey,
            ),
            child: Icon(
              bell_icon_state == true
                  ? FontAwesomeIcons.bell
                  : FontAwesomeIcons.bellSlash,
              color: bell_icon_state == true
                  ? Color.fromRGBO(33, 63, 141, 1)
                  : Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
              bell_icon_state = !bell_icon_state;
            });
          },
        ),
      ],
    );
  }
}
