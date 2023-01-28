import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:efficacy_user/widgets/bottom_navigation_bar.dart';
import 'package:efficacy_user/widgets/subscribe_button.dart';
import 'package:efficacy_user/widgets/subscription_tab_buttons.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter_portal/flutter_portal.dart';
import '../widgets/filter_menu_item.dart';
import 'account_screen.dart';

class SubscriptionPage extends StatefulWidget {
  static const route = '/subscription_page';
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  String selectedValue = 'All Clubs';
  List<String> filterOptions = [
    'All Clubs',
    'Subscribed Clubs',
    'Unsubscribed Clubs'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Portal(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            shadowColor: Theme.of(context).appBarTheme.shadowColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            elevation: Theme.of(context).appBarTheme.elevation,
            title: Text(
              'Subsciptions',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 24,
                  ),
            ),
            actions: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  customButton: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.filter_alt_outlined,
                          size: 30,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                    ),
                  ),
                  items: filterOptions
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: FilterMenuItem(
                            text: item,
                            isSelected: selectedValue == item,
                          )))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value.toString();
                    });
                  },
                  itemHeight: size.height * 0.07,
                  dropdownWidth: size.width * 0.6,
                  dropdownPadding: const EdgeInsets.symmetric(vertical: 20),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  offset: Offset(size.width * -0.30, 0),
                  dropdownOverButton: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, anotherAnimation) {
                          return const AccountScreen();
                        },
                        transitionDuration: const Duration(milliseconds: 1200),
                        transitionsBuilder:
                            (context, animation, anotherAnimation, child) {
                          animation = CurvedAnimation(
                              curve: Curves.easeIn, parent: animation);
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }));
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColorLight.secondary,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' $selectedValue',
                    style: Theme.of(context).textTheme.headline3?.copyWith(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(),
                        title: const Text('Illuminatis'),
                        trailing: TextButton(
                          child: SizedBox(
                            width: (size.width * 0.35),
                            child: Subscribe(),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(),
                        title: const Text('Illuminatis'),
                        trailing: TextButton(
                          child: SizedBox(
                            width: (size.width * 0.35),
                            child: Subscribe(),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
