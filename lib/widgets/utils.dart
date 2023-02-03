import 'package:flutter/material.dart';
void showSnackBar({required BuildContext context,required String text, IconData? icon}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(children: [
          ...icon != null ? [Icon(icon), const SizedBox(width: 5)] : [],
          Text(text),
        ]),
      ),
    );
