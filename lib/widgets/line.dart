import 'package:Efficacy/config.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  double L, T, R, B;
  Line({this.L, this.T, this.R, this.B});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(L, T, R, B),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Color(hexColor(grayBG)),
      ),
    );
  }
}
