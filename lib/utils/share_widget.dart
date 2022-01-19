import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Share extends StatelessWidget {
  const Share({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.share_outlined,
      size: 16,
      color: Color(0xff213F8D),
    );
  }
}
