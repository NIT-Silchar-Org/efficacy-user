import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter/material.dart';

class SubscriptionTabButton extends StatelessWidget {
  final String title;
  const SubscriptionTabButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.05,
        child: TextButton(
            onPressed: () {},
            child: Text(
              title,
              style: TextStyle(color: AppColorLight.buttontextcolor),
            )),
        width: 312,
        decoration: BoxDecoration(
          border: Border.all(color: AppColorLight.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ));
  }
}
