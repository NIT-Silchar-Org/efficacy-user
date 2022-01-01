import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter/material.dart';

class Subscribe extends StatelessWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorLight.primary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: AppColorLight.primary,
        ),
        child: Row(
          children: const [
            Icon(Icons.add_to_photos_outlined, size: 15),
            SizedBox(width: 3),
            Text(
              'Subscribe',
              style: TextStyle(
                color: Color.fromRGBO(33, 63, 141, 1),
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
