// import 'package:efficacy_user/pages/homescreen.dart';
// import 'package:efficacy_user/pages/sign_up.dart';
<<<<<<< Updated upstream
import 'package:efficacy_user/pages/account_screen.dart';
=======
>>>>>>> Stashed changes
import 'package:efficacy_user/pages/club_details.dart';
import 'package:efficacy_user/pages/event_screen.dart';
import 'package:efficacy_user/pages/homescreen.dart';
import 'package:efficacy_user/pages/sign_up.dart';
import 'package:efficacy_user/themes/efficacy_theme.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/pages/google_sign_in.dart';
<<<<<<< Updated upstream
import 'package:efficacy_user/pages/subscription_page.dart';
=======
import 'package:efficacy_user/pages/account_screen.dart';
>>>>>>> Stashed changes

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const AccountScreen(),
      routes: <String, WidgetBuilder>{
        '/signup_screen': (BuildContext context) => const SignUp(),
        '/home_screen': (BuildContext context) => const HomeScreen(),
        '/event_screen': (BuildContext context) => const EventScreen(),
      },
    );
  }
}
