import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/client_user_model.dart';
import 'package:efficacy_user/models/user_model.dart';
import 'package:efficacy_user/pages/edit_Account.dart';
import 'package:efficacy_user/pages/about_us.dart';
import 'package:efficacy_user/pages/google_sign_in.dart';
import 'package:efficacy_user/widgets/divider.dart';
import 'package:efficacy_user/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  ClientUserModel user = ClientUserModel(
      Email: '---',
      phNumber: '---',
      userID: '---',
      name: '---',
      scholarID: '---',
      year: '---',
      branch: '---');
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    isloading = true;
    getdata();
    isloading = false;
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
                  width: 200,
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
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        title: const Text('Account'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditAccount()));
              // do something
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
              )),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              // do something
              await auth.signOut();
              await GoogleSignIn().signOut();
              showSnackBar(context: context, text: 'Succesfully Logged Out');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : SlidingUpPanel(
              maxHeight: devicesize.height,
              minHeight: devicesize.height * 0.6,
              panelBuilder: (sc) => Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: ListView(
                    // scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    controller: sc,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 10),
                        child: const PanelDivider(),
                        // child: Divider(
                        //   color: const Color(0xff180000).withOpacity(0.17),
                        //   height: 20,
                        //   thickness: 4,
                        //   indent: 100,
                        //   endIndent: 100,
                        // ),
                      ),
                      const Text(
                        'Personal Information',
                        style:
                            TextStyle(color: Color(0xff213F8D), fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      infoFun('Name', user.name),
                      infoFun('Email', user.Email),
                      infoFun('Phone No.', user.phNumber),
                      infoFun('Scholar ID', user.scholarID!),
                      infoFun('Year', user.year!),
                      infoFun('Branch', user.branch!),
                      // const Text(
                      //   'Theme',
                      //   style:
                      //       TextStyle(color: Color(0xff213F8D), fontSize: 22),
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: RadioButton(
                      //         description: "Dark",
                      //         value: "Dark",
                      //         onChanged: (S) {
                      //           //setState(() {});
                      //         },
                      //         groupValue: 2,
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: RadioButton(
                      //         description: "Light",
                      //         value: "Light",
                      //         onChanged: (S) {},
                      //         groupValue: 2,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'Developed by',
                        style: GoogleFonts.poppins(
                            color: Color(0xff213F8D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/gdsc_logo.png',
                              height: 5, width: 5),
                          Text(
                            'Google Developers Student Club, NIT Silchar',
                            style: GoogleFonts.poppins(
                                color: Color(0xff213F8D),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )

                      // ElevatedButton(
                      //   onPressed: () async {
                      //     await auth.signOut();
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => SignIn()),
                      //     );
                      //     // Perform some action
                      //   },
                      //   child: Text('Log Out'),
                      // ),
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
                        height: 50,
                      ),
                      CircleAvatar(
                          radius: devicesize.width * 0.125,
                          backgroundImage:
                              NetworkImage(auth.currentUser?.photoURL ?? "")),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                            color: AppColorLight.primary, fontSize: 20),
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
    late ClientUserModel userfetched;
    User? userloggedin = auth.currentUser;
    String? uuid = userloggedin?.uid;
    print('Inside Get Data');
    await FirebaseFirestore.instance
        .collection('clientUser')
        .doc(uuid)
        .get()
        .then((snapshot) {
      userfetched = ClientUserModel.fromJson(snapshot.data()!);
      print('Name Printing');
      userfetched.scholarID ??= '---';
      userfetched.year ??= '---';
      userfetched.branch ??= '---';
    });

    setState(() {
      user = userfetched;
    });
  }
}
