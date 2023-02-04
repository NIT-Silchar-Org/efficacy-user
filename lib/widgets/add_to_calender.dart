import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCalender extends StatelessWidget {
  const AddToCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          // width: 50,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffDAE5FF),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10,),
              const Icon(
                Icons.event_note_outlined,
                size: 13,
                color: Color(0xff213F8D),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Add to Calender",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xff213F8D),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}