import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/creators.dart';
import 'package:Efficacy/services/aboutDevelopers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(value: AboutDevelopersDatabase().getMentors),
        StreamProvider.value(value: AboutDevelopersDatabase().getDevelopers),
        StreamProvider.value(value: AboutDevelopersDatabase().getDesigners),
      ],
      child: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Developer> developers = Provider.of<List<Developer>>(context) ?? [];
    List<Mentor> mentors = Provider.of<List<Mentor>>(context) ?? [];
    List<Designer> designers = Provider.of<List<Designer>>(context) ?? [];
    // print("developers" + developers.length.toString());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Mentors"),
              ),
              Tab(
                child: Text("Developers"),
              ),
              Tab(
                child: Text("Designers"),
              ),
            ],
          ),
          title: Text('About Us'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            ListView(
                children: mentors
                    .map(
                      (m) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () async {
                              if (m.linkedIn.length == 0) {
                                await launch(fallbackURLweb);
                              } else {
                                await launch(m.linkedIn);
                              }
                            },
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  (m.image.length == 0)
                                      ? fallbackURL_profile
                                      : m.image),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(m.name),
                            subtitle: Text(m.designation + " | " + m.branch),
                          ),
                        ),
                      ),
                    )
                    .toList()),
            ListView(
                children: developers
                    .map(
                      (m) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () async {
                              if (m.linkedIn.length == 0) {
                                await launch(fallbackURLweb);
                              } else {
                                await launch(m.linkedIn);
                              }
                            },
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  (m.image.length == 0)
                                      ? fallbackURL_profile
                                      : m.image),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(m.name),
                            subtitle: Text(m.designation + " | " + m.branch),
                          ),
                        ),
                      ),
                    )
                    .toList()),
            ListView(
                children: designers
                    .map(
                      (m) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () async {
                              if (m.linkedIn.length == 0) {
                                await launch(fallbackURLweb);
                              } else {
                                await launch(m.linkedIn);
                              }
                            },
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  (m.image.length == 0)
                                      ? fallbackURL_profile
                                      : m.image),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(m.name),
                            subtitle: Text(m.designation + " | " + m.branch),
                          ),
                        ),
                      ),
                    )
                    .toList()),
          ],
        ),
      ),
    );
  }
}
