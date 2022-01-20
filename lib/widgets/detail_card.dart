import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCard extends StatelessWidget {
  String text1;
  String? text2;
  IconData icon;
  DetailCard({Key? key, required this.text1, this.text2, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 21),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFFFF0B6)),
            child: Center(
              child: Icon(
                icon,
                size: 14,
                color: const Color(0xffFECC07),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xff191C1D).withOpacity(0.7),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                text2 != null
                    ? Text(
                        text2!,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xff191C1D).withOpacity(0.5),
                            fontSize: 8.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
