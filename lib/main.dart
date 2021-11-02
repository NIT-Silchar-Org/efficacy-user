import 'dart:async';
import 'package:Efficacy/screens/Team.dart';
import 'package:Efficacy/screens/noInternet.dart';
import 'package:Efficacy/screens/clubPage.dart';
import 'package:Efficacy/screens/eventScreen.dart';
import 'package:Efficacy/screens/feedScreen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import './screens/profile.dart';
import './screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './screens/clubs.dart';
import './screens/register_screen.dart';
import './screens/clubPage.dart';
import './config.dart';
import './utilities/utilities.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(OverlaySupport(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool connection = true;
  var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      print(_connectionStatus);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          connection = true;
        });
      } else {
        setState(() {
          connection = false;
        });
      }
    });
    _firebaseMessaging.getToken().then((value) => print("token" + value));
    _firebaseMessaging.subscribeToTopic('active');
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      // print("onMessage: $message");
      showOverlayNotification((context) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: SafeArea(
            child: ListTile(
              onTap: () {
                print("onMessage event id" + message["data"]["id"].toString());
                navigatorKey.currentState.pushNamed("/event",
                    arguments: {"id": message["data"]["id"].toString()});
              },
              leading: CircleAvatar(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/efficacy_logo.jpg"),
              )),
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
              trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    OverlaySupportEntry.of(context).dismiss();
                  }),
            ),
          ),
        );
      }, duration: Duration(milliseconds: 4000));

      print(message['notification']['title']);
    }, onResume: (message) async {
      print(message["data"]["click_action"]);
      print("Data ID" +
          message["data"]["id"] +
          "type" +
          (message["data"]["id"] is String).toString());
      navigatorKey.currentState.pushNamed("/event",
          arguments: {"id": message["data"]["id"].toString()});
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
      print(message["data"]["id"]);
      navigatorKey.currentState.pushReplacementNamed("/");
      navigatorKey.currentState.pushNamed("/event",
          arguments: {"id": message["data"]["id"].toString()});
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        backgroundColor: Colors.blue,
        primaryColor: Colors.blue,
        primaryTextTheme: TextTheme(),
      ),
      routes: {
        "/": (context) => (connection) ? Wrapper() : NoInternet(),
        "/register": (context) => (connection) ? Register() : NoInternet(),
        "/clubs": (context) => (connection) ? Clubs() : NoInternet(),
        "/profile": (context) => (connection) ? Profile() : NoInternet(),
        "/event": (context) => (connection) ? EventScreen() : NoInternet(),
        "/oneClub": (context) => (connection) ? ClubPage() : NoInternet(),
        "/about_us": (context) => Team(),
      },
    );
  }
}
