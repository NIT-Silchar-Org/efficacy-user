import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/client_user_model.dart';
import 'package:efficacy_user/models/user_model.dart';
import 'package:efficacy_user/pages/edit_Account.dart';
import 'package:efficacy_user/pages/google_sign_in.dart';
import 'package:efficacy_user/widgets/utils.dart';
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
        title: Text('Account'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditAccount()));
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.blueAccent,
            ),
            onPressed: () async {
              // do something
              await auth.signOut();
              showSnackBar(context: context, text: 'Succesfully Logged Out');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
          ),
        ],
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : SlidingUpPanel(
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
                        style:
                            TextStyle(color: Color(0xff213F8D), fontSize: 22),
                      ),
                      infoFun('Name', user.name),
                      infoFun('Email', user.Email),
                      infoFun('Phone No.', user.phNumber),
                      infoFun('Scholar ID', user.scholarID!),
                      infoFun('Year', user.year!),
                      infoFun('Branch', user.branch!),
                      const Text(
                        'Theme',
                        style:
                            TextStyle(color: Color(0xff213F8D), fontSize: 22),
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
                      SizedBox(
                        height: 50,
                        width: 50,
                      ),
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
                        height: 30,
                      ),
                      const CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/2922/2922510.png')),
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
      if (userfetched.scholarID == null) {
        userfetched.scholarID = '---';
      }
      if (userfetched.year == null) {
        userfetched.year = '---';
      }
      if (userfetched.branch == null) {
        userfetched.branch = '---';
      }
    });

    setState(() {
      user = userfetched;
    });
  }
}
