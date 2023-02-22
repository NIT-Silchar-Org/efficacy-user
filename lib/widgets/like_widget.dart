import 'package:efficacy_user/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Like extends StatefulWidget {
  final bool isLiked;
  final String eventId;
  Like({Key? key, required this.isLiked, required this.eventId})
      : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isLiked = !widget.isLiked);
        Provider.of<EventProvider>(context, listen: false)
            .likeUnlikeEvent(!isLiked, widget.eventId)
            .then((value) => setState(() => isLiked = value));
      },
      child: Icon(
        isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
        size: 16,
        color: const Color(0xff213F8D),
      ),
    );
  }
}
