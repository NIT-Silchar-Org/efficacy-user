import 'package:efficacy_user/models/all_events.dart';
import 'package:efficacy_user/models/event_model.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../pages/event_screen.dart';

class EventTile extends StatefulWidget {
  final AllEvent? eventModel;
  const EventTile({Key? key, required this.eventModel}) : super(key: key);

  // final String cardBannerUrl;
  // final String gdscImageUrl;
  // final Function onPressed;

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile>
    with SingleTickerProviderStateMixin {
  bool expandState = false;
  late ExpandableController _expandController;
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _expandController = ExpandableController();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _sizeAnimation = Tween<double>(begin: 0, end: 10).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          expandState = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          expandState = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _expandController.dispose();
    _controller.dispose();
    super.dispose();
  }

  // void _animateToIndex(int index) {
  //   _controller.animateTo(
  //     index * 100,
  //     duration: const Duration(milliseconds: 1000),
  //     curve: Curves.easeIn,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Theme.of(context).cardTheme.shadowColor!,
                spreadRadius: 10,
                blurRadius: 30,
              ),
            ]),
            child: Card(
              margin: Theme.of(context).cardTheme.margin,
              shadowColor: Theme.of(context).cardTheme.shadowColor,
              elevation: Theme.of(context).cardTheme.elevation,
              shape: Theme.of(context).cardTheme.shape,
              child: Padding(
                padding: EdgeInsets.all(_sizeAnimation.value),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // _animateToIndex(10);
                        // Navigator.pushNamed(context, '/event_screen');
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, anotherAnimation) {
                              return EventScreen(
                                  eventId: widget.eventModel?.eventId ?? '');
                            },
                            transitionDuration:
                                const Duration(milliseconds: 1200),
                            transitionsBuilder:
                                (context, animation, anotherAnimation, child) {
                              animation = CurvedAnimation(
                                  curve: Curves.easeIn, parent: animation);
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              imageUrl: widget.eventModel?.posterUrl ?? '',
                              fit: BoxFit.cover,
                              errorWidget: (context, url, _) =>
                                  const Center(child: Icon(Icons.error)),
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                          value: progress.progress)))),
                    ),
                    ExpandablePanel(
                        controller: _expandController,
                        theme: const ExpandableThemeData(
                          useInkWell: false,
                          hasIcon: false,
                          tapHeaderToExpand: false,
                          tapBodyToCollapse: false,
                        ),
                        header: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                              child: CachedNetworkImage(
                                  height: 30,
                                  width: 30,
                                  imageUrl: widget.eventModel?.posterUrl ?? '',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, _) =>
                                      const Center(child: Icon(Icons.error)),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                          child: CircularProgressIndicator(
                                              value: progress.progress))),
                            ),
                          ),
                          title: Text(widget.eventModel?.name ?? '',
                              style: Theme.of(context).textTheme.headline3),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                color: Theme.of(context).iconTheme.color,
                                size: 17,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat.yMMMEd().format(
                                    widget.eventModel?.startTime ??
                                        DateTime(0)),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.schedule_rounded,
                                color: Theme.of(context).iconTheme.color,
                                size: 17,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat.jm().format(
                                    widget.eventModel?.startTime ??
                                        DateTime(0)),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                        collapsed: const SizedBox(),
                        expanded: Text(
                          widget.eventModel?.description.toString() ?? '',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontSize: 13),
                        ),
                        builder: (_, collapsed, expanded) => Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                              ),
                            )),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _expandController.toggle();
              expandState ? _controller.reverse() : _controller.forward();
            },
            child: Icon(
              expandState
                  ? MdiIcons.chevronUpCircleOutline
                  : MdiIcons.chevronDownCircleOutline,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
