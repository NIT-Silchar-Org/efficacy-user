import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsWidget extends StatefulWidget {
  final String text;

  const DetailsWidget({Key? key, required this.text}) : super(key: key);
  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 80) {
      firstHalf = widget.text.substring(0, 80);
      secondHalf = widget.text.substring(80, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: const Color(0xff191C1D).withOpacity(0.5),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
              ),
            )
          : Column(
              children: <Widget>[
                Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xff191C1D).withOpacity(0.5),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "show more" : "show less",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xff213F8D),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
