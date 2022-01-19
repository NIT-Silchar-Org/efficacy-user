import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Follow extends StatelessWidget {
  const Follow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffDAE5FF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.add_to_photos_outlined,
            size: 10,
            color: Color(0xff213F8D),
          ),
          Text(
            "Follow",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xff213F8D),
                fontSize: 10.0,
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
