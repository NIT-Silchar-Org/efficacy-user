import 'package:flutter/material.dart';
import 'package:Efficacy/models/event.dart';

class ImagePopOut extends StatelessWidget {
  const ImagePopOut({
    Key key,
    @required this.event,
}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images6.alphacoders.com/107/thumb-1920-1072679.jpg")
          )
        ),
      ),
    );
  }
}
