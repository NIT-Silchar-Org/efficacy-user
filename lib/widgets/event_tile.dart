import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    Key? key,
    required this.cardBannerUrl,
    required this.gdscImageUrl,
    required this.onPressed,
  }) : super(key: key);

  final String cardBannerUrl;
  final String gdscImageUrl;
  final Function onPressed;
  //final EventCloud event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shadowColor: AppColorLight.cardShadow,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => onPressed(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(cardBannerUrl, fit: BoxFit.cover),
              ),
            ),
            ExpandablePanel(
                theme: const ExpandableThemeData(
                  useInkWell: false,
                  tapHeaderToExpand: true,
                  tapBodyToCollapse: true,
                ),
                header: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Image.network(gdscImageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  title: Text('Flutter Bootcamp',
                      style: Theme.of(context).textTheme.headline3),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        color: AppColorLight.subtitleText,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Sep 28',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.schedule_rounded,
                        color: AppColorLight.subtitleText,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '6:00 PM',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                collapsed: const SizedBox(),
                expanded: Text(
                  lorem(paragraphs: 1, words: 30),
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
    );
  }
}
