import 'package:efficacy_user/widgets/bottom_navigation_bar.dart';
import 'package:efficacy_user/widgets/subscribe_button.dart';
import 'package:efficacy_user/widgets/subscription_tab_buttons.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:flutter_portal/flutter_portal.dart';

class SubscriptionPage extends StatefulWidget {
  static const route = '/subscription_page';
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Portal(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColorLight.background,
            title: Text(
              'Subscriptions',
              style: TextStyle(color: AppColorLight.mainText),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: size.width,
                height: size.height * 0.1,
                color: AppColorLight.primary,
                child: PortalEntry(
                  visible: isMenuOpen,
                  portalAnchor: Alignment.topLeft,
                  childAnchor: Alignment.bottomLeft,
                  portal: Material(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    elevation: 8,
                    child: IntrinsicWidth(
                      stepWidth: size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SubscriptionTabButton(title: 'All Clubs'),
                          SubscriptionTabButton(title: 'Subscribed Clubs'),
                          SubscriptionTabButton(title: 'Unsubscribed Clubs'),
                        ],
                      ),
                    ),
                  ),
                  child: TextButton(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Filters',
                          style: TextStyle(
                              color: AppColorLight.mainText,
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColorLight.mainText),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Icon(
                            Icons.filter_list_outlined,
                            color: AppColorLight.mainText,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        if (isMenuOpen) {
                          isMenuOpen = false;
                        } else {
                          isMenuOpen = true;
                        }
                      });
                    },
                  ),
                ),
              ),
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
                            width: (size.width * 0.3),
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
                            width: (size.width * 0.3),
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
