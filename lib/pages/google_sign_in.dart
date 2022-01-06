// import 'dart:math';
import '../widgets/signin_button.dart';
import 'dart:ui';
import 'package:efficacy_user/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
// import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  bool isauthenticate = false;
  String initialcountry = 'IN';

  void sign() {
    setState(() {
      isauthenticate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //  First part gradient background
          buildBackground(),
          //    Part III Gaussian
          Center(
            child: isauthenticate
                ? const SignUp()
                : GlassmorphicContainer(
                    width: 350,
                    height: 400,
                    borderRadius: 20,
                    blur: 0,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFbde6ed).withOpacity(0.5),
                        const Color((0xFFbde6ed)).withOpacity(0.5),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            image: DecorationImage(
                              image: AssetImage('assets/efficacy_logo.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        SignInButton(callback: sign),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }

  //  First part gradient background
  buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlueAccent.withOpacity(0.3),
            Colors.lightBlue.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

  buildTopText() {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2,
      top: 30,
      child: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(200)),
          image: DecorationImage(
            image: AssetImage('assets/efficacy_logo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
