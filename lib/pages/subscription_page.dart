import 'package:cached_network_image/cached_network_image.dart';
import 'package:efficacy_user/widgets/bottom_navigation_bar.dart';
import 'package:efficacy_user/widgets/subscribe_button.dart';
import 'package:efficacy_user/widgets/subscription_tab_buttons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubscriptionPage extends StatefulWidget {
  static const route = '/subscription_page';
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool isMenuOpen = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Portal(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColorLight.background,
            title: Text(
              'Subscriptions',
              style: TextStyle(color: AppColorLight.mainText),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: size.width,
                height: size.height * 0.1,
                color: AppColorLight.primary,
                child: PortalEntry(
                  visible: isMenuOpen,
                  portalAnchor: Alignment.topLeft,
                  childAnchor: Alignment.bottomLeft,
                  portal: Material(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    elevation: 8,
                    child: IntrinsicWidth(
                      stepWidth: size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * 0.05,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Text('All Club'),
                              ),
                              width: 312,
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? Color.fromARGB(255, 189, 222, 248)
                                    : Colors.white,
                                border:
                                    Border.all(color: AppColorLight.primary),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * 0.05,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Text('Subscribed Club'),
                              ),
                              width: 312,
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? Color.fromARGB(255, 189, 222, 248)
                                    : Colors.white,
                                border:
                                    Border.all(color: AppColorLight.primary),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * 0.05,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                  child: Text(
                                    'Unsubscribed Club',
                                    style: TextStyle(
                                        color: AppColorLight.buttontextcolor),
                                  )),
                              width: 312,
                              decoration: BoxDecoration(
                                color: index == 2
                                    ? Color.fromARGB(255, 189, 222, 248)
                                    : Colors.white,
                                border:
                                    Border.all(color: AppColorLight.primary),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  child: TextButton(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Filters',
                          style: TextStyle(
                              color: AppColorLight.mainText,
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColorLight.mainText),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Icon(
                            Icons.filter_list_outlined,
                            color: AppColorLight.mainText,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        if (isMenuOpen) {
                          isMenuOpen = false;
                        } else {
                          isMenuOpen = true;
                        }
                      });
                    },
                  ),
                ),
              ),
              if (index == 0)
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Clubs')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Expanded(
                      child: ListView(
                        children: snapshot.data!.docs.map((document) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: ListTile(
                                // leading: CircleAvatar(backgroundImage: document['clubLogoUrl']),

                                title: Text(document['clubName']),
                                trailing: TextButton(
                                  child: SizedBox(
                                    width: (size.width * 0.3),
                                    child: Subscribe(),
                                  ),
                                  onPressed: () => null,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              if (index == 1)
                Container(
                  child: Text("Subscribe Club"),
                ),
              if (index == 2)
                Container(
                  child: Text("Unsubscribe Club"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
