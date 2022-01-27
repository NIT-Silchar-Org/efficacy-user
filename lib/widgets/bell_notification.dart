import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter/material.dart';

class Bell extends StatelessWidget {
  final bool isnotification;

  const Bell({Key? key, this.isnotification = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  size: 24,
                  color: AppColorLight.mainText,
                ),
                onPressed: () {},
              ),
            ),
          ),
          isnotification
              ? CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColorLight.primary,
                )
              : const SizedBox(width: 0),
        ],
      ),
    );
  }
}
