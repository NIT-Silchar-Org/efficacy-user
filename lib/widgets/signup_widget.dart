import 'package:efficacy_user/provider/google_signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:efficacy_user/widgets/phone_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  GoogleSignInAccount user;
  SignUp({Key? key, required this.user}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController namecontroller, emailcontroller, phonenocontroller;
  @override
  void initState() {
    namecontroller = TextEditingController(text: widget.user.displayName);
    emailcontroller = TextEditingController(text: widget.user.email);
    phonenocontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    phonenocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        return 'Select a email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                    child: PhoneWidget(controller: phonenocontroller),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 42,
                    width: 130,
                    child: OutlinedButton(
                      onPressed: () {
                        bool isvalid = _formkey.currentState!.validate();
                        if (isvalid) {
                          _formkey.currentState!.save();
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                          print('login');
                        }
                      },
                      child: const Text('FINISH'),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
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
