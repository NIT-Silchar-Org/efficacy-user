import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Like extends StatelessWidget {
  const Like({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.thumb_up_alt_outlined,
      size: 16,
      color: Color(0xff213F8D),
    );
  }
}
