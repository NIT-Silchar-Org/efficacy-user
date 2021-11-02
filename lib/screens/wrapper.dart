import 'package:Efficacy/screens/clubs.dart';
import 'package:Efficacy/screens/feedScreen.dart';
import 'package:Efficacy/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(value: DatabaseService().clubsFromCloud),
        StreamProvider.value(value: DatabaseService().eventsFromCloud),
      ],
      child: FeedScreen(),
    );
  }
}
