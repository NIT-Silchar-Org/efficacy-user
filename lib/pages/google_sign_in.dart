import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/signin_button.dart';
import 'dart:ui';
import 'package:efficacy_user/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  static const route = 'sign_in';
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isauthenticate = false;
  String initialcountry = 'IN';
  late GoogleSignInAccount _currentuser;
  void sign(GoogleSignInAccount user) {
    setState(() {
      _currentuser = user;
      isauthenticate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/wave-1.svg',
              height: 230,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/wave.svg',
              height: 120,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          //    Part III Gaussian
          Center(
            child: isauthenticate
                ? SignUp(user: _currentuser)
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
                            shape: BoxShape.circle,
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
