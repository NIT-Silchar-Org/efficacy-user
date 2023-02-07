import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Subscribe extends StatefulWidget {
  // const Subscribe({Key? key}) : super(key: key);

  final String clubId;

  Subscribe({required this.clubId});

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  bool subscribe_button_state = false;
  bool bell_icon_state = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('clientUser')
          .doc(
              '0AH4606SVPfKps1tfH9OjkXnT5z2') //'abcde' is for reference will be replaced by uuid
          .get(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              subscribe_button_state = snapshot.data!
                      .data()?['subscriptions']
                      ?.contains(widget.clubId) ??
                  false;
            });
          });
        }

        return Row(
          children: [
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(3),
                height: 40,
                width: 85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColorLight.primary,
                    width: 0.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    topLeft: Radius.circular(7),
                  ),
                  color: subscribe_button_state == true
                      ? AppColorLight.primary
                      : Colors.grey,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility(
                      visible: !isLoading,
                      child: Center(
                        child: Text(
                          subscribe_button_state == true
                              ? 'Subscribed'
                              : 'Subscribe',
                          style: TextStyle(
                            color: subscribe_button_state == true
                                ? const Color.fromRGBO(33, 63, 141, 1)
                                : Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLoading,
                      child: const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                Map<String, dynamic>? data = (await FirebaseFirestore.instance
                        .collection('clientUser')
                        .doc(
                            '0AH4606SVPfKps1tfH9OjkXnT5z2') //'abcde' is for reference will be replaced by uuid
                        .get())
                    .data();
                if (subscribe_button_state) {
                  if (data!['subscriptions'] != null) {
                    data['subscriptions']?.remove(widget.clubId);
                    if (data['subscriptions'] == null) {
                      data['subscriptions'] = [];
                    }
                  }
                } else {
                  data?.addAll({
                    'subscriptions': (data['subscriptions'] == null ||
                            data['subscriptions'].isEmpty)
                        ? [widget.clubId]
                        : [...data['subscriptions'], widget.clubId]
                  });
                }
                // print(data);
                try {
                  FirebaseFirestore.instance
                      .collection('clientUser')
                      .doc('0AH4606SVPfKps1tfH9OjkXnT5z2')
                      .set(data ?? {})
                      .then((value) => setState(() {
                            subscribe_button_state = !subscribe_button_state;
                            isLoading = false;
                          }));
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),
            Container(
              height: 40,
              width: 1,
              decoration: BoxDecoration(color: Colors.white),
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(3),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColorLight.primary,
                    width: 0.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  color: bell_icon_state == true
                      ? AppColorLight.primary
                      : Colors.grey,
                ),
                child: Icon(
                  bell_icon_state == true
                      ? FontAwesomeIcons.bell
                      : FontAwesomeIcons.bellSlash,
                  color: bell_icon_state == true
                      ? Color.fromRGBO(33, 63, 141, 1)
                      : Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  bell_icon_state = !bell_icon_state;
                });
              },
            ),
          ],
        );
      },
    );
  }
}
