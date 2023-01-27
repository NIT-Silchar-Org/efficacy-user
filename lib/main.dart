import 'package:efficacy_user/pages/about_us.dart';
import 'package:efficacy_user/pages/club_details.dart';
import 'package:efficacy_user/pages/event_screen.dart';
import 'package:efficacy_user/pages/explore_screen.dart';
import 'package:efficacy_user/pages/feed_screen.dart';
import 'package:efficacy_user/pages/homescreen.dart';
import 'package:efficacy_user/provider/event_provider.dart';
import 'package:efficacy_user/provider/explore_screen_provider.dart';
import 'package:efficacy_user/provider/feedscreen_provider.dart';
import 'package:efficacy_user/provider/google_signin_provider.dart';
import 'package:efficacy_user/provider/loading_provider.dart';
import 'package:efficacy_user/themes/efficacy_theme.dart';
import 'package:efficacy_user/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/pages/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:efficacy_user/pages/subscription_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<EventProvider>.value(value: EventProvider()),
            ChangeNotifierProvider<GoogleSignInProvider>.value(
                value: GoogleSignInProvider()),
            ChangeNotifierProvider<FeedscreenProvider>.value(
                value: FeedscreenProvider()),
            ChangeNotifierProvider<LoadingProvider>(
              create: (context) => LoadingProvider(),
            ),
            ChangeNotifierProvider<ExploreScreenProvider>(
              create: (context) => ExploreScreenProvider(),
            ),
          ],
          child: Consumer<GoogleSignInProvider>(
            builder: (context, value, child) => MaterialApp(
              theme: AppTheme.light,
              debugShowCheckedModeBanner: false,
              home: snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.orangeAccent,
                    )
                  : value.currentUser()
                      ? const HomeScreen()
                      //                      : const SignIn(),
                      : const HomeScreen(),
              routes: <String, WidgetBuilder>{
                HomeScreen.route: (BuildContext context) => const HomeScreen(),
                EventScreen.route: (BuildContext context) =>
                    const EventScreen(),
                ClubDetail.route: (BuildContext context) => const ClubDetail(),
                ExploreScreen.route: (BuildContext context) =>
                    const ExploreScreen(),
                FeedScreen.route: (BuildContext context) => const FeedScreen(),
                SignIn.route: (BuildContext context) => const SignIn(),
                SubscriptionPage.route: (BuildContext context) =>
                    const SubscriptionPage(),
              },
            ),
          ),
        );
      },
    );
  }
}
