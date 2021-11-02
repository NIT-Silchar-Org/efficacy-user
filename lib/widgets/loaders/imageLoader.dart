import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[50],
      height: 150,
      child: Center(
        child: SpinKitWanderingCubes(
          color: Colors.teal,
          size: 50.0,
        ),
      ),
    );
  }
}
