import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/event.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/services/database.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/description.dart';
import 'package:Efficacy/widgets/loaders/loader.dart';
// import 'package:Efficacy/widgets/eventTile.dart';
import 'package:Efficacy/widgets/sabt.dart';
import 'package:Efficacy/widgets/tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:provider/provider.dart';
import 'package:Efficacy/widgets/clubEvent.dart';

class ClubPage extends StatefulWidget {
  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    PaginateRefreshedChangeListener refreshChangeListener =
        PaginateRefreshedChangeListener();
    return StreamBuilder<Object>(
        stream: DatabaseService(id: id).fetchClub,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Club club = snapshot.data;

            return Container(
              child: Material(
                color: Colors.blue,
                child: Scaffold(
                  body: DefaultTabController(
                    length: 2,
                    child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              elevation: 0,
                              iconTheme: IconThemeData(
                                color: Colors.white,
                              ),
                              expandedHeight: 200.0,
                              floating: false,
                              pinned: true,
                              flexibleSpace: FlexibleSpaceBar(
                                  background: Image.network(
                                    club.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  centerTitle: true,
                                  title: SABT(
                                      child: Text(
                                    club.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ))),
                            ),
                            SliverPersistentHeader(
                              delegate: _SliverAppBarDelegate(
                                TabBar(
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Colors.blueAccent,
                                  ),
                                  labelPadding: EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 1.0),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.blue,
                                  tabs: [
                                    Tab(child: Icon(Icons.event)),
                                    Tab(
                                      child: Icon(Icons.info),
                                    ),
                                  ],
                                ),
                              ),
                              floating: true,
                            ),
                          ];
                        },
                        body: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TabBarView(children: [
                            // Text("Under construction"),

                            RefreshIndicator(
                              onRefresh: () async {
                                refreshChangeListener.refreshed = true;
                              },
                              child: PaginateFirestore(
                                itemBuilder: (index, context, snapshot) {
                                  EventCloud e = EventCloud(
                                      id: snapshot.documentID ??
                                          'NULL ID DATABASE SERVICE EVENTCLOUD',
                                      title: snapshot.data()["title"] ??
                                          'event title',
                                      startTime: snapshot.data()["startTime"].toDate() ??
                                          DateTime.now(),
                                      imageUrl: snapshot.data()["imageUrl"] ??
                                          fallbackURL_image,
                                      googleFormLink:
                                          snapshot.data()["googleFormLink"] ??
                                              '',
                                      fbPostLink:
                                          snapshot.data()["fbPostLink"] ?? '',
                                      endTime: snapshot.data()["endTime"].toDate() ??
                                          DateTime.now(),
                                      clubId:
                                          snapshot.data()["clubId"] ?? 'clubid',
                                      clubName: snapshot.data()["clubName"] ??
                                          'clubname',
                                      about:
                                          snapshot.data()["about"] ?? 'about',
                                      duration: snapshot
                                              .data()["endTime"]
                                              .toDate()
                                              .difference(snapshot.data()["startTime"].toDate())
                                              .inHours ??
                                          2);

                                  return ClubEventTile(
                                    event: e,
                                  );
                                },
                                query: FirebaseFirestore.instance
                                    .collection('events')
                                    .orderBy("startTime", descending: true)
                                    .where("clubId", isEqualTo: id),
                                listeners: [
                                  refreshChangeListener,
                                ],
                                itemBuilderType: PaginateBuilderType.listView,
                              ),
                            ),

                            SingleChildScrollView(
                                child: DescriptionSection(club: club)),
                          ]),
                        )),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(hexColor(BG)),
              ),
            );
          } else {
            return Scaffold(body: Loader());
          }
        });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
