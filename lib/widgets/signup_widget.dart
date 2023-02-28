import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/pages/homescreen.dart';
import 'package:efficacy_user/provider/google_signin_provider.dart';
import 'package:efficacy_user/widgets/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart' as input;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:efficacy_user/widgets/intl_phone.dart';
import '../models/client_user_model.dart';

class SignUp extends StatefulWidget {
  final GoogleSignInAccount? user;
  const SignUp({Key? key, required this.user}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = true;
  late TextEditingController namecontroller, emailcontroller;
  // late TextEditingController phonenocontroller;
  input.PhoneNumber phNumber = input.PhoneNumber();
  @override
  void initState() {
    namecontroller = TextEditingController(text: widget.user?.displayName);
    emailcontroller = TextEditingController(text: widget.user?.email);
    // phonenocontroller = TextEditingController();
    isUserCreated().then((value) => setState(() {
          isLoading = false;
        }));
    super.initState();
  }

  Future<void> isUserCreated() async {
    try {
      if (FirebaseAuth.instance.currentUser?.uid == null) {
        GoogleSignInAccount? account =
            Provider.of<GoogleSignInProvider>(context, listen: false).user;
        if (account != null) {
          GoogleSignInAuthentication googleSignInAuthentication =
              await account.authentication;
          AuthCredential credentials = GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);
          await FirebaseAuth.instance.signInWithCredential(credentials);
        }
      }
      bool check = (await FirebaseFirestore.instance
              .collection('clientUser')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get())['phNumber'] !=
          null;
      if (check && mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen();
        }));
      }
    } catch (e) {
      return;
    }
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    // phonenocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : GlassmorphicContainer(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height * 0.77,
            borderRadius: 20,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
            ),
            border: 1,
            blur: 5,
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 120,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      image: DecorationImage(
                        image: AssetImage('assets/efficacy_logo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Custom text input box
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(43, 158, 179, 0.19),
                                width: 0.1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            prefixIcon: Icon(Icons.mail),
                            labelText: 'Email',
                            enabled: false,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Select a email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: namecontroller,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(43, 158, 179, 0.19),
                                width: 0.1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Name',
                            enabled: false,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                          child: IntlPhone(
                            onInputChanged: (input.PhoneNumber phoneNumber) {
                              phNumber = phoneNumber;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 42,
                          width: 130,
                          child: OutlinedButton(
                            onPressed: () async {
                              bool isvalid = _formkey.currentState!.validate();
                              if (isvalid) {
                                setState(() => isLoading = !isLoading);
                                _formkey.currentState!.save();

                                var status =
                                    await Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false)
                                        .googleLogin();

                                ClientUserModel client = ClientUserModel(
                                  name: namecontroller.text,
                                  userID: FirebaseAuth.instance.currentUser?.uid
                                          .toString() ??
                                      "",
                                  Email: emailcontroller.text,
                                  phNumber:
                                      '${phNumber.dialCode!} ${phNumber.phoneNumber!}',
                                );
                                FirebaseFirestore.instance
                                    .collection('clientUser')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .set(
                                  {
                                    'name': client.name,
                                    'userId':
                                        FirebaseAuth.instance.currentUser?.uid,
                                    'Email': client.Email,
                                    'phNumber': client.phNumber,
                                    'subscriptions': FieldValue.arrayUnion(
                                        ['FQ0YthDf9vh5sG2uU0vI'])
                                  },
                                ).then((value) async {
                                  if (status.toString() == "Logged In") {
                                    setState(() => isLoading = !isLoading);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return const HomeScreen();
                                    }));
                                  } else {
                                    setState(() => isLoading = !isLoading);
                                  }
                                });
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text('FINISH'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
