import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/client_user_model.dart';
import 'package:efficacy_user/pages/homescreen.dart';
import 'package:efficacy_user/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:efficacy_user/models/user_model.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  static const id = "/personalInfo";
  final String? userId;
  const EditAccount({Key? key, this.userId}) : super(key: key);
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController name1 = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController scholarid = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController branch = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  ClientUserModel user = ClientUserModel(
      Email: '---',
      phNumber: '---',
      userID: '---',
      name: '---',
      branch: '---',
      scholarID: '---',
      year: '---');

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    name1.text = user.name;
    email.text = user.Email;

    // //year.text = user.year!;
    // branch.text = user.branch!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,

          title: Text('Account'),
          actions: <Widget>[
            IconButton(
              icon: Icon(

                Icons.save,
                color: Colors.white,
              ),
              onPressed: () {
                updateinfo();
                // do something
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: name1,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: email,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: scholarid,
                decoration: InputDecoration(
                  labelText: "Scholar ID",
                ),
                obscureText: false,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: year,
                decoration: InputDecoration(
                  labelText: "Year",
                ),
                // obscureText: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: branch,
                decoration: InputDecoration(
                  labelText: "Branch",
                ),
                // obscureText: true,
              ),
            ],
          ),
        ),
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
    });

    setState(() {
      print("fecthed user" + userfetched.name);
      if (userfetched.scholarID == null) {
        scholarid.text = user.scholarID!;
      } else {
        scholarid.text = userfetched.scholarID!;
      }
      if (userfetched.year == null) {
        year.text = user.year!;
      } else {
        year.text = userfetched.year!;
      }
      if (userfetched.branch == null) {
        branch.text = user.branch!;
      } else {
        branch.text = userfetched.branch!;
      }

      user = userfetched;
    });
  }

  Future<void> updateinfo() async {
    User? userloggedin = auth.currentUser;
    String? uuid = userloggedin?.uid;
    CollectionReference users =
        FirebaseFirestore.instance.collection('clientUser');
    await users
        .doc(uuid)
        .set({
          'scholarID': scholarid.text,
          'year': year.text,
          'branch': branch.text
        }, SetOptions(merge: true))
        .then((value) => print("Value Added"))
        .catchError((error) => print("Failed to add Value: $error"));
    print("Updating Value");
    showSnackBar(context: context, text: 'Details Updated!');

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
