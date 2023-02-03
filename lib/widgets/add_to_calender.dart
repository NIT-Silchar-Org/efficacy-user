import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCalender extends StatelessWidget {
  const AddToCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 160,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffDAE5FF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.event_note_outlined,
            size: 12,
            color: Color(0xff213F8D),
          ),
          Text(
            "Add to Calender",
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
