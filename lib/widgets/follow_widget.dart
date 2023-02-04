import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Follow extends StatelessWidget {
  const Follow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.25,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffDAE5FF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            FontAwesomeIcons.bell,
            size: 13,
            color: Color(0xff213F8D),
          ),
          Text(
            "Subscribe",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xff213F8D),
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
