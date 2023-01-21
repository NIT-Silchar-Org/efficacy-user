import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:group_radio_button/group_radio_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  int _selectedIndex = 0;
  //late UserModel user;
  UserModel user = UserModel(
      name: '---',
      scholarid: '---',
      year: '---',
      branch: '---',
      degree: '---',
      email: '---',
      phonenum: '---');
  //late UserModel user;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  BorderRadiusGeometry sheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  Widget infoFun(String s1, String s2) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s1,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: const Color(0xff191C1D).withOpacity(0.5),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s2,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xff191C1D).withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 1,
                  color: const Color(0xff191C1D).withOpacity(0.2),
                  child: const Divider(),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: devicesize.height,
        minHeight: devicesize.height * 0.65,
        panelBuilder: (sc) => Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: ListView(
              // scrollDirection: Axis.vertical,
              shrinkWrap: false,
              controller: sc,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Divider(
                    color: const Color(0xff180000).withOpacity(0.17),
                    height: 20,
                    thickness: 2,
                    indent: 100,
                    endIndent: 100,
                  ),
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(color: Color(0xff213F8D), fontSize: 22),
                ),
                infoFun('Name', user.name),
                infoFun('Scholar ID', user.scholarid),
                infoFun('Year ', user.year),
                infoFun('Branch ', user.branch),
                infoFun('Degree', user.degree),
                infoFun('Email', user.email),
                infoFun('Phone No.', user.phonenum),
                const Text(
                  'Theme',
                  style: TextStyle(color: Color(0xff213F8D), fontSize: 22),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioButton(
                        description: "Dark",
                        value: "Dark",
                        onChanged: (S) {
                          //setState(() {});
                        },
                        groupValue: 2,
                      ),
                    ),
                    Expanded(
                      child: RadioButton(
                        description: "Light",
                        value: "Light",
                        onChanged: (S) {},
                        groupValue: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //collapsed: null,
        //defaultPanelState: PanelState.OPEN,
        body: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.blue[900],
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  radius: 45,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.name,
                  style: TextStyle(color: AppColorLight.primary, fontSize: 20),
                )
              ],
            ),
          ),
        )),
        borderRadius: sheetRadius,
      ),
    );
  }

  Future<void> getdata() async {
    late UserModel userfetched;
    User? userloggedin = auth.currentUser;
    String? uuid = userloggedin?.uid;
    print('Inside Get Data');
    await FirebaseFirestore.instance
        .collection('Users')
        .doc('abcde') //'abcde' is for reference will be replaced by uuid
        .get()
        .then((snapshot) {
      userfetched = UserModel.fromJson(snapshot.data()!);
      print('Name Printing');
      print(user.name);
    });

    setState(() {
      user = userfetched;
    });
  }
}
